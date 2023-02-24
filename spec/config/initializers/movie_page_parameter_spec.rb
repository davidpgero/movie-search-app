require 'rails_helper'

describe MoviePageParameter do
  describe '#page' do
    specify { expect(Tmdb::Search.new.respond_to?(:page)).to be_truthy }
  end
end
