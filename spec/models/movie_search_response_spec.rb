require 'rails_helper'

describe MovieSearchResponse do
  let(:response_results) {
    [{ 'adult' => false,
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
       'vote_count' => 16 }]
  }

  describe '#movies' do
    subject { described_class.new(results: results).movies }

    context 'without results' do
      let(:results) { nil }

      specify { expect(subject).to eq [] }
    end

    context 'with results' do
      let(:results) { response_results }

      specify { expect(subject.first.title).to eq 'Hello' }
    end
  end
end
