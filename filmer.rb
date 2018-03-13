current_path = File.dirname(__FILE__)

require "#{current_path}/film"

films = []
i = 1

while File.exist?("#{current_path}/data/#{i}.txt")
  data = []
  f = File.new("#{current_path}/data/#{i}.txt", "r:UTF-8")
  data = f.readlines
  f.close
  film = Film.new(data)
  films << film
  i += 1
end

puts "Добро пожаловать в фильмо-теку Anikram."
puts "предлагаю выбрать фильм одного из моих любимых режиссеров:"
puts

directors = []

for film in films do
  unless directors.include?(film.director)
    directors << "#{film.director}"
  end
end

i = 1

for item in directors do
  puts "#{i}. #{item}"
  i += 1
end

user_input = STDIN.gets.to_i

good_films = []

if directors[user_input - 1]
# поправка на элементы массива (начало с 0)
  for film in films do
    if film.director == directors[user_input - 1]
      good_films << film
    end
  end
else
  abort "Такого режиссера нет в списке."
end

the_film = good_films.sample

puts "Сегодня предлагаю посмотреть:"
puts "#{the_film.director} - \"#{the_film.title}\" (#{the_film.year})"
