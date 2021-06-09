class ApplicationMailer < ActionMailer::Base
  default from: 'teachapp.lewagon@gmail.com'
  layout 'mailer'
#  def render_files
#    attachments.inline['teachapplogo.svg'] = File.read(Rails.root.join('/app/assets/images/teachapplogo.svg'))
#  end
end
