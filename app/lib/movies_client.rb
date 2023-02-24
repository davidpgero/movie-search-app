class MoviesClient
  THEMOVIEDB_API_KEY = ENV['THEMOVIEDB_API_KEY']

  def search(query)
    return null_response unless query

    search = movies.query(query)
    response = search.fetch_response

    MovieSearchResponse.new(response['page'], response['results'], response['total_pages'], response['total_results'])
  end

  private

  MovieSearchResponse = Struct.new(:page, :results, :total_pages, :total_results)

  def search_client
    @search_client = begin
                       Tmdb::Api.key(THEMOVIEDB_API_KEY)
                       Tmdb::Search.new
                     end
  end

  def movies
    search_client.resource('movie')
  end

  def null_response
    MovieSearchResponse.new(1, [], 1, 0)
  end
end
