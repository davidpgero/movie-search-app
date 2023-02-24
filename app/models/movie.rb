class Movie
  include ActiveModel::Model

  attr_accessor :id, :overview, :title, :vote_average, :vote_count, :poster_path
end
