class MoviesClient
  THEMOVIEDB_API_KEY = ENV['THEMOVIEDB_API_KEY']

  def initialize(search_query)
    @search_query = search_query
  end

  def search
    return null_response unless query

    search = client_with_query(query, page)
    response = fetch_response(search)
    Rails.cache.increment(hit_cache_key)

    build_response(response)
  end

  private
  attr_reader :search_query
  delegate :query, :page, :cache_key, :hit_cache_key, to: :search_query

  def fetch_response(search)
    expires_in = 2.minutes

    Rails.cache.fetch(cache_key, expires_in: expires_in) do
      Rails.cache.write(hit_cache_key, 0, raw: true, expires_in: expires_in)
      search.fetch_response
    end
  end

  def client_with_query(query, page)
    Tmdb::Api.key(THEMOVIEDB_API_KEY)
    Tmdb::Search.new.resource('movie').query(query).page(page)
  end

  def null_response
    build_response({page: 1, results: [], total_pages: 1, total_results: 0})
  end

  def build_response(response, cache_key: nil)
    MovieSearchResponse.new(
      page: response['page'],
      results: response['results']&.flat_map(&:with_indifferent_access),
      total_pages: response['total_pages'],
      total_results: response['total_results']
    )
  end
end
