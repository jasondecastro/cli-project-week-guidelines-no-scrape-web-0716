class Interface

  def call
    puts "This is Zoltar the Great."
    puts "I will tell you your fortune, but first you need to answer a few questions.\n"
    run
  end
    
  def get_user_input
    gets.strip
  end

  def run
    print 'What is your first name? '
    name = get_user_input
    print 'What is your 10-digit phone number? '
    number = format_number(get_user_input)
    
    search(name, number)
  end

  def format_number(number)
    "+1" + number.gsub(/\D/, "")
  end

  def search(name, number)
    if exists?(name)
      Message.new(name, number)
    else
      puts 'We couldn\'t find your name in the registry. Sorry.'
    end
  end

  def exists?(name)
    case name.downcase
    when "abi"
      name = "Abigail"
    when "cliff"
      name = "Clifton"
    when "alex"
      name = "Alexandria"
    end

    StudentParser.new.activate.detect do | person |
      person["Name"].split(" ")[0].downcase == name.downcase    
    end
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to search for a Tweet"
  end

end

