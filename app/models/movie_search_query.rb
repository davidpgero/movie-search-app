class MovieSearchQuery
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :query, :string
  attribute :page, :integer

  validates :query, :page, presence: true
  validates :page, numericality: :only_integer

  def cache_key
    "movies-client/#{query.to_s.parameterize}/#{page}"
  end

  def hit_cache_key
    "hit/#{cache_key}"
  end
end
