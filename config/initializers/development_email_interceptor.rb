if !Rails.env.test? && ENV['EMAIL_NO_INTERCEPTOR'].nil? && ENV['EMAILS_FALLBACK'].nil?
  raise 'you need set a env variable EMAILS_FALLBACK or in production set EMAIL_NO_INTERCEPTOR to `true`'
end
class EmailInterceptor
  def self.delivering_email(message)
    authorized_emails = ENV.fetch('EMAILS_AUTHORIZED', '').split(',')
    email_fallback = ENV.fetch('EMAILS_FALLBACK').split(',')
    return if message.to.all? { |email| email.in? authorized_emails }
    message.subject = "#{message.to} #{message.subject}"
    message.to = email_fallback
  end
end
unless ENV['EMAIL_NO_INTERCEPTOR'] == 'true' || Rails.env.test?
  ActionMailer::Base.register_interceptor(EmailInterceptor)
end
