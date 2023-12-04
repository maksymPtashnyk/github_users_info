require 'faraday'
require 'dotenv/load'

class GithubController < ApplicationController
  def index
    # Get the GitHub login value from the form
    @github_login = params[:github_login]

    # Make a request to the GitHub API using GraphQL
    response = Faraday.post('https://api.github.com/graphql') do |req|
      req.headers['Authorization'] = "Bearer #{ENV['GITHUB_API_TOKEN']}"
      req.headers['Content-Type'] = 'application/json'
      req.body = { query: graphql_query(@github_login) }.to_json
    end

    # Process the response from the GitHub API
    if response.success?
      data = JSON.parse(response.body)['data']
      
      if data && data['user'] && data['user']['name']
        @github_name = data['user']['name']
      else
        puts 'User name information is missing or invalid'
      end
    
      if data && data['user'] && data['user']['repositories'] && data['user']['repositories']['nodes'].is_a?(Array)
        @repos = data['user']['repositories']['nodes'].map { |repo| repo['name'] }
      else
        puts 'User repositories or nodes information is missing or invalid'
      end
      
      # Fetch the avatar URL if it exists
      if data && data['user'] && data['user']['avatarUrl']
        @avatar_url = data['user']['avatarUrl']
      else
        puts 'Avatar URL is missing'
      end
    else
      puts 'Error retrieving data from GitHub'
    end
  end

  private

  def graphql_query(github_login)
    <<~GRAPHQL
      query {
        user(login: "#{@github_login}") {
          name
          repositories(last: 20) {
            nodes {
              name
            }
          }
          avatarUrl
        }
      }
    GRAPHQL
  end
end
