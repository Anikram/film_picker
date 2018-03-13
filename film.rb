class Film
  def initialize(data)
    @title = data[0]
    @director = data[1]
    @year = data[2]
  end
  def title
    @title
  end
  def director
    @director
  end
  def year
    @year
  end
end
