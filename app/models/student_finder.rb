require 'pry'

class StudentFinder
  attr_reader :all_student_data_hash

  def initialize
    @all_student_data_hash = StudentParser.new.activate
  end

  def find(first_name)
    case first_name.downcase
    when "abi"
      first_name = "Abigail"
    when "cliff"
      first_name = "Clifton"
    when "alex"
      first_name = "Alexandria"
    end

    all_student_data_hash.detect do | person |
      person["Name"].split(" ")[0].downcase == first_name.downcase    
    end
  end
end