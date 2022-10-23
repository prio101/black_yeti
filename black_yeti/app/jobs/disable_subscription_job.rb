class DisableSubscriptionJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.update(accept_newsletter: !user.accept_newsletter)
    # sender_email = 'info@jmtgoodyard.com'
    # from = SendGrid::Email.new(email: sender_email)
    # to = SendGrid::Email.new(email: 'miprio101@gmail.com')
    # subject = 'Registration Confirmation Email'
    # content = SendGrid::Content.new(type: 'text/plain', value: "Hello, miprio101@gmail.com you just unsubscribed with us.")
    # mail = SendGrid::Mail.new(from, subject, to, content)

    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    # response = sg.client.mail._('send').post(request_body: mail.to_json)

    # puts response.status_code

    # puts response.body
    # puts response.headers
  end
end
