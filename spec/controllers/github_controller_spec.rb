# frozen_string_literal: true

require 'rails_helper'
require 'vcr'

RSpec.describe GithubController, type: :controller do
  describe 'GET #index' do
    # ...

    context 'when GitHub login provided' do
      let(:github_login) { 'someusername' }

      it 'makes a successful API request and extracts user information', vcr: { cassette_name: 'github_api_success' } do
        VCR.use_cassette('github_api_success') do
          get :index, params: { github_login: }
          expect(assigns(:github_login)).to eq(github_login)
        end
      end

      it 'handles API request failure gracefully', vcr: { cassette_name: 'github_api_failure' } do
        VCR.use_cassette('github_api_failure') do
          allow(Faraday).to receive(:post).and_return(instance_double(Faraday::Response, success?: false))
          get :index, params: { github_login: }
          expect(assigns(:error)).to eq('Error retrieving data from GitHub')
        end
      end
    end
  end
end
