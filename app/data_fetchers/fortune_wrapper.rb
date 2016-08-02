class FortuneStuff
  def initialize
    @fortune = RestClient.get("https://helloacm.com/api/fortune/")
  end

  def activate
    eval(@fortune.gsub('\\n', ''))
  end
end