require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'GET /index' do
    specify do
      get root_path

      expect(response).to render_template(:index)
      expect(response.body).to include('Previous')
      expect(response.body).to include('Next')
    end
  end
end
