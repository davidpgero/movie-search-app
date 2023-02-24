require 'rails_helper'

describe MovieSearchQuery do
  subject { described_class.new(query: 'test', page: 1) }

  describe '.new' do
    specify do
      expect(subject.query).to eq 'test'
      expect(subject.page).to eq 1
      expect(subject.valid?).to be_truthy
    end

    context 'invalid parameters' do
      subject { described_class.new(query: nil, page: 'not_number') }

      specify do
        expect(subject.query).to eq nil
        expect(subject.page).to eq 0
        expect(subject.valid?).to be_falsey
      end
    end
  end

  describe '#cache_key' do
    specify { expect(subject.cache_key).to eq 'movies-client/test/1' }
  end

  describe '#hit_cache_key' do
    specify { expect(subject.hit_cache_key).to eq 'hit/movies-client/test/1' }
  end
end
