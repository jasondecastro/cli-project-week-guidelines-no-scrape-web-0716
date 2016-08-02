class SpotifyChart

  attr_reader :student_data

  def initialize
    @path = '../data_stores/student_information.json'
    @student_data = JSON.load(open(@path))
  end

  def 
  end
end
