#encoding: utf-8

class Film
  def self.load_films(current_path)
    @films = []
    i = 1

    while File.exist?("#{current_path}/#{i}.txt")
      data = []
      f = File.new("#{current_path}/#{i}.txt", "r:UTF-8")
      data = f.readlines
      f.close
      film = Film.new(data)
      @films << film
      i += 1
    end

    @films
  end

  def self.load_all_directors
    @directors = []

    @films.each do |film|
      unless @directors.include?(film.director)
        @directors << "#{film.director}"
      end
    end
  end

  def self.show_all_directors
    i = 1

    @directors.each do |director|
      puts "#{i}. #{director}"
      i += 1
    end
  end

  def self.choose_film_by_director
    user_input = STDIN.gets.to_i

    good_films = []

    if @directors[user_input - 1]
      # поправка на элементы массива (начало с 0)
      for film in @films do
        if film.director == @directors[user_input - 1]
          good_films << film
        end
      end

      good_films.sample
    else
      abort "Такого режиссера нет в списке."
    end
  end

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
  def to_s
    "#{@director.chomp} - \"#{@title.chomp}\" (#{@year.chomp})"
  end
end
