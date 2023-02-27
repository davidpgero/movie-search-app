class MovieSearchResponse
  include ActiveModel::Model

  attr_accessor :page, :results, :total_pages, :total_results

  def movies
    return [] unless results

    results.flat_map do |result|
      build_movie(result.with_indifferent_access)
    end
  end

  private

  def build_movie(result)
    Movie.new(
      id:           result[:id],
      overview:     result[:overview],
      title:        result[:title],
      vote_average: result[:vote_average],
      vote_count:   result[:vote_count],
      poster_path:  result[:poster_path]
    )
  end
end
