require 'rails_helper'

describe MoviesClient do
  let(:response) {
    {'page' => 1,
     'results' =>
       [{'adult' => false,
         'backdrop_path' => nil,
         'genre_ids' => [],
         'id' => 1027497,
         'original_language' => 'en',
         'original_title' => 'Hello',
         'overview' =>
           "An emotionally unavailable flight attendant meets a potential love interest and later finds out that her \"perfect guy\" has ulterior motives. As the clock ticks down on New Year's Eve, she must fight to keep her murdered ex-boyfriend's secrets or find herself dead.",
         'popularity' => 4.563,
         'poster_path' => '/ouRgdCdPd6aiRjIl8dNHDBv51br.jpg',
         'release_date' => '2022-09-22',
         'title' => 'Hello',
         'video' => false,
         'vote_average' => 6.9,
         'vote_count' => 16},
        {'adult' => false,
         'backdrop_path' => '/bNYxr3GGXRthtDRFCnloXO4r3xC.jpg',
         'genre_ids' => [35],
         'id' => 20365,
         'original_language' => 'hi',
         'original_title' => 'Hello',
         'overview' => 'Call-center workers receive a phone call from God.',
         'popularity' => 3.797,
         'poster_path' => '/qpN7Td4djkQp4vFDjaGGAWgueTQ.jpg',
         'release_date' => '2008-10-10',
         'title' => 'Hello',
         'video' => false,
         'vote_average' => 5.922,
         'vote_count' => 32},
        ],
     'total_pages' => 43,
     'total_results' => 846}
  }

  describe '#search' do
    subject { described_class.new(query).search }

    context 'with empty query' do
      let(:query) { MovieSearchQuery.new(query: '', page: 1) }

      specify do
        expect(subject.page).to eq 1
        expect(subject.results).to eq []
        expect(subject.total_pages).to eq 1
        expect(subject.total_results).to eq 0
      end
    end

    context 'with query' do
      let(:query) { MovieSearchQuery.new(query: 'hello', page: 1) }
      let(:search) { Tmdb::Search.new }

      before { allow(search).to receive(:fetch_response).and_return(response) }

      specify do
        expect(subject.page).to eq 1
        expect(subject.results.size).to eq 20
        expect(subject.total_pages).to eq 43
        expect(subject.total_results).to eq 846
      end
    end
  end
end
