module MoviesHelper
  def background_path(movie)
    return 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg' unless movie&.poster_path

    "https://image.tmdb.org/t/p/w500#{movie.poster_path}"
  end
end
