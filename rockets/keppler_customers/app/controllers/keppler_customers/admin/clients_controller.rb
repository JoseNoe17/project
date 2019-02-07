
# frozen_string_literal: true

require_dependency "keppler_customers/application_controller"
module KepplerCustomers
  module Admin
    # ClientsController
    class ClientsController < ::Admin::AdminController
      layout 'keppler_customers/admin/layouts/application'
      before_action :set_client, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /customers
      def index
        respond_to_formats(@clients)
        redirect_to_index(@objects)
      end

      # GET /customers/1
      def show; end

      # GET /customers/new
      def new
        @client = Client.new
      end

      # GET /customers/1/edit
      def edit; end

      # POST /customers
      def create
        @client = Client.new(client_params)

        if @client.save
          redirect(@client, params)
        else
          render :new
        end
      end

      # PATCH/PUT /customers/1
      def update
        if @client.update(client_params)
          redirect(@client, params)
        else
          render :edit
        end
      end

      def clone
        @client = Client.clone_record params[:client_id]
        @client.save
        redirect_to_index(@objects)
      end

      # DELETE /customers/1
      def destroy
        @client.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Client.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Client.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Client.sorter(params[:row])
      end

      private

      def index_variables
        @q = Client.ransack(params[:q])
        @clients = @q.result(distinct: true)
        @objects = @clients.page(@current_page).order(position: :asc)
        @total = @clients.size
        @attributes = Client.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = Client.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def client_params
        params.require(:client).permit(
          :title, :image
        )
      end
    end
  end
end
