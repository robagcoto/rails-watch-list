require "json"
require "open-uri"
require 'faker'

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.parse(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie|
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
end

10.times do
  List.create!(
    name: Faker::Book.unique.genre
  )
end

5.times do
  Bookmark.create!(
    comment: Faker::Quote.famous_last_words,
    list: List.all.sample,
    movie: Movie.all.sample
  )
end
