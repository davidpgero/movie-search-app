class MoviesController < ApplicationController
  def index
    @search_query = MovieSearchQuery.new(query: search_params[:query], page: search_params[:page])
    @movie_search_response = MoviesClient.new(@search_query).search
    @hits = Rails.cache.read(@search_query.hit_cache_key, raw: true).presence || 1
  end

  private

  def search_params
    params.permit(:query, :page, :commit).with_defaults(query: nil, page: 1)
  end
end
