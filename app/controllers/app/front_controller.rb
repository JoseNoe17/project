module App
  # FrontsController
  class FrontController < AppController
    before_action :message

    def send_message
    end
    
    def new_message
      @user = params[:message]
      @message = KepplerContactUs::Message.new( 
        name: params[:message][:name], 
        content: params[:message][:content],
        to_emails: params[:message][:from_email]
      )
      if verify_recaptcha(model: @message) && @message.save
        UserMailer.send_message(@user).deliver_now
        UserMailer.send_message3(@user).deliver_now 
        @message.from_email = params[:message][:to_emails]
        flash[:notice] = 'Mensaje enviado'
        flash[:name] = params[:message][:name]
        
        redirect_to root_path
      else
        redirect_to root_path      
        flash[:notice] = 'Mensaje no enviado'
      end

    end
    
    
    def index
      @banners = KepplerBanners::Banner.all
      @clients = KepplerCustomers::Client.all
    end

    def about
    end

    def form
    end
    private
    def message
      @message = KepplerContactUs::Message.new
    end
  end
  
end
