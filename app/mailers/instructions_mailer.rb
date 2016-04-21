class InstructionsMailer < ApplicationMailer
  default from: "savoritco@yahoo.com"

  def instructions_email
    mail(to: "reach.zaki.ahmed@gmail.com",subject: 'SavorIt Delivery Time!')
    @current_user = User.find_by id: session[:user_id]
end

end
