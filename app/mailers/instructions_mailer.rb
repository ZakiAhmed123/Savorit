class InstructionsMailer < ApplicationMailer
  default from: "savoritco@yahoo.com"

  def instructions_email(user)
    @user=user
    mail(to: "reach.zaki.ahmed@gmail.com",subject: 'SavorIt Delivery Time!')
end

end
