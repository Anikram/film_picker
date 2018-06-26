#encoding: utf-8
current_path = File.dirname(__FILE__)

require_relative "lib/film"

puts "Добро пожаловать в фильмо-теку Anikram."
puts "предлагаю выбрать фильм одного из моих любимых режиссеров:"
puts

Film.load_films(current_path + "/data")

Film.load_all_directors

Film.show_all_directors

the_film = Film.choose_film_by_director

puts "Сегодня предлагаю посмотреть:"
puts the_film.to_s
