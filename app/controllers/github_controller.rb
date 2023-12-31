# frozen_string_literal: true

require 'faraday'
require 'dotenv/load'

# GithubController handles requests related to GitHub user information.
# It communicates with the GitHub API to retrieve user data such as repositories, name, and avatar.
class GithubController < ApplicationController
  def index
    @github_login = params[:github_login]
    return handle_blank_login if @github_login.blank?

    handle_non_blank_login
  end

  private

  def handle_blank_login
    @message = 'You can see all users repo, just enter user login'
  end

  def handle_non_blank_login
    response = make_github_api_request(@github_login)
    return handle_successful_response(response) if response.success?

    handle_failed_response
  end

  def handle_successful_response(response)
    data = JSON.parse(response.body)['data']
    extract_github_user_information(data)
  end

  def handle_failed_response
    @error = 'Error retrieving data from GitHub'
  end

  def make_github_api_request(github_login)
    Faraday.post('https://api.github.com/graphql') do |req|
      req.headers['Authorization'] = "Bearer #{ENV['GITHUB_API_TOKEN']}"
      req.headers['Content-Type'] = 'application/json'
      req.body = { query: graphql_query(github_login) }.to_json
    end
  end

  def extract_github_user_information(data)
    if data && data['user']
      extract_github_user_name(data['user'])
      extract_github_repositories(data['user']['repositories'])
      extract_github_avatar(data['user']['avatarUrl'])
    else
      @error = 'User data is missing'
    end
  end

  def extract_github_user_name(user_data)
    @github_name = user_data['name'] if user_data['name']
    @githun_url = user_data['url']
  end

  def extract_github_repositories(repositories_data)
    if repositories_data['totalCount']
      @repos = repositories_data['nodes'].map { |repo| { name: repo['name'], url: repo['url'] } }
      @repos_count = repositories_data['totalCount']
    else
      {}
    end
  end

  def extract_github_avatar(avatar_url)
    @avatar_url = avatar_url if avatar_url
  end

  def graphql_query(github_login)
    <<~GRAPHQL
      query {
        user(login: "#{github_login}") {
          name
          url
          repositories(last: 20) {
            totalCount
            nodes {
              name
              url
            }
          }
          avatarUrl
        }
      }
    GRAPHQL
  end
end
