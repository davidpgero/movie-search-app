require 'rails_helper'

RSpec.describe MoviesHelper, type: :helper do
  let(:movie) { Movie.new(poster_path: '/testing.jpg') }
  let(:movie_without_image) { Movie.new }

  describe '#background_path' do
    context 'with path' do
      specify { expect(background_path(movie)).to eq "https://image.tmdb.org/t/p/w500/testing.jpg" }
    end

    context 'without path' do
      specify do
        expect(background_path(movie_without_image))
          .to eq "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
      end
    end
  end
end
