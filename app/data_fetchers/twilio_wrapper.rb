require 'twilio-ruby'

class TwilioStuff

  TWILIO_NUMBER = '+16463623998'

  attr_reader :student_data, :client

  def initialize
    account_sid = 'AC499b0b2477461f0b417fd79f0cc0a9b3'
    auth_token = '1a1f186e149af311706de4701b0e96a3'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(student_number, message)
    @client.messages.create(
      from: TWILIO_NUMBER,
      to: student_number,
      body: message
    )
  end

  def student_data_hash
    @student
  end

end
