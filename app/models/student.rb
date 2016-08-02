class Student
  attr_accessor :first_name, :last_name, :email, :birthday, :where_they_grew_up, :current_location

  def initialize(name)
    @one_student_data_hash = StudentFinder.new.find(name)
    # @birthday = nil
    # @where_they_grew_up = nil
    # @current_location = nil
    
    get_information
  end

  def get_information
    @first_name = @one_student_data_hash["Name"].split(" ")[0]
    @last_name = @one_student_data_hash["Name"].split(" ")[1]
    @email = @one_student_data_hash["Email"]
    @birthday = @one_student_data_hash["Birthday"]
    @where_they_grew_up = @one_student_data_hash["Where did you grow up?"]
    @current_location = @one_student_data_hash["Where do you live now?"]
  end
end