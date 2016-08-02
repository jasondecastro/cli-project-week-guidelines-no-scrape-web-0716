require 'pry'

class Message
  attr_reader :student, :phone_number
  attr_accessor :month, :day

  MONTHS = [
    {
      "01" => "January",
      "02" => "February",
      "03" => "March",
      "04" => "April",
      "05" => "May",
      "06" => "June",
      "07" => "July",
      "08" => "August",
      "09" => "September",
      "10" => "October",
      "11" => "November",
      "12" => "December",
    }
  ]

  def initialize(first_name, phone_number)
    @student = Student.new(first_name)
    @month = nil
    @day = nil
    @phone_number = phone_number
    send_message
    send_email
  end

  def format_month
    birthday = student.birthday.split("/")
    month = birthday[0]
    month = "0" + month if month.length == 1
    month = MONTHS[0][month]
    "#{month}"
  end

  def format_next_month
    birthday = student.birthday.split("/")
    month = birthday[0]
    next_month = (month.to_i + 1).to_s
    next_month = "0" + next_month if next_month.length == 1
    next_month = "01" if next_month == "13"
    next_month = MONTHS[0][next_month]
    "#{next_month}"
  end

  def format_day
    birthday = student.birthday.split("/")
    day = birthday[1] + "th"

    case day[-3]
    when "1"
      day[-2..-1] = "st"
    when "2"
      day[-2..-1] = "nd"
    when "3"
      day[-2..-1] = "rd"
    end
      
    " #{day}"
  end

  def birthday
    format_month + format_day
  end


  def get_fortune
    FortuneStuff.new.activate
  end

  def send_message
    TwilioStuff.new.send_text(phone_number, build_message)
  end

  def send_email
    EmailStuff.new(get_fortune, student.first_name, student.last_name, student.email)
  end

  def build_message
    # binding.pry
    "Hmmmmmm.. I'm getting a feeling your birthday is somewhere around #{format_month} or #{format_next_month}... But nah, it's actually #{birthday}, isn't it?\n\nNow I know you're probably freaking out right now. But don't worry. I know everything about you.\n\nFor example, I think we met once back when you lived in #{student.where_they_grew_up.split(',')[0]} if I'm not mistaken. \n\n I'm going to send you a fortune now. Check your e-mail, #{student.first_name} #{student.last_name}."
  end
end


