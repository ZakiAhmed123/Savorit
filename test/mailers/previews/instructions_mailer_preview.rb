# Preview all emails at http://localhost:3000/rails/mailers/instructions_mailer
class InstructionsMailerPreview < ActionMailer::Preview
def sample_email_preview
  # InstructionsMailer.instructions_email(User.find_by id: session[:user_id])
end
end
