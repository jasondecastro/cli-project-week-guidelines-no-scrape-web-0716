require 'rest-client'

class StudentParser
  attr_reader :url

  def initialize
    @url = RestClient.get('http://pastebin.com/raw/nBw6S1uz')
  end

  def activate
    @student_data = JSON.parse(url)
  end

end
