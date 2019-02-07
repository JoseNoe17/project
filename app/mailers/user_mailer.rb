class UserMailer < ApplicationMailer
  def send_message(user)
      @user = user
      mail(to: @user[:to_emails], subject: 'Arlides Group')
  end 

  def send_message2(user)
      @message = user
      mail(to: @message[:to_emails], subject: 'Arlides Group')
  end 
end
