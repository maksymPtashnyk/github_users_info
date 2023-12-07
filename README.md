# Project: GitHub Users Info

### This project implements a form to input a GitHub login, after which it displays the GitHub user's name and a list of their repositories and edition information. Request processing is done via GraphQL using the graphql-ruby library. It retrieves data from the GitHub API through the following requests:

 - https://api.github.com/users/<GITHUB_LOGIN>
 - https://api.github.com/users/<GITHUB_LOGIN>/repos

### Local Server Setup:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/maksymPtashnyk/github_users_info.git
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    ```

3. **Run the server:**

    ```bash
    rails server
    ```

4. **Access the application locally:**

    Open your web browser and go to [http://localhost:3000](http://localhost:3000).

### Accessing the Live Application:

You can directly access and use the application deployed on Heroku without setting it up locally. Visit [GitHub Users Info - Heroku](https://repos-bbbb992225ab.herokuapp.com/) to access the live version of the application.

By following these steps, you can either run the server locally using the provided instructions or directly use the deployed version of the application hosted on Heroku without any local setup.

## Application Capabilities:

 ### The application interface consists of:

  - GitHub User Information Page: Allows users to input a GitHub login.
  - Find Information Button: Submits the form to retrieve data.
  - Display Area: Shows the user's GitHub name, avatar (if available), number of repositories, and a list of repositories with their links.
  
 ### Upon submission, the application can:

  - Fetch the user's GitHub name.
  - Retrieve the user's avatar (if available).
  - Display the total number of repositories.
  - List the user's repositories with links to their GitHub pages.
  
 ### In case of errors or invalid input:

  - The application handles errors and displays relevant messages to the user.

### Main Dependencies

- **Ruby** (`ruby`, `~> 3.2.0`): The Ruby version 3.2.0.
- **Rails** (`rails`, `~> 7.1.2`): The Ruby on Rails framework version 7.1.2.
- **Sprockets** (`sprockets-rails`): The original asset pipeline for Rails.
- **SQLite** (`sqlite3`, `~> 1.4`): Database adapter for Active Record.
- **Puma** (`puma`, `>= 5.0`): Web server used in Rails by default.
- **Importmap-Rails** (`importmap-rails`): Enables JavaScript with ESM import maps in Rails.
- **Turbo-Rails** (`turbo-rails`): Hotwire's SPA-like page accelerator for Rails.
- **Stimulus-Rails** (`stimulus-rails`): Hotwire's modest JavaScript framework for Rails.
- **Jbuilder** (`jbuilder`): Helps build JSON APIs easily.

### Development and Test Dependencies

#### Development

- **Debug** (`debug`): Gem for debugging Rails applications.
- **Rails Controller Testing** (`rails-controller-testing`): Provides integration with Rails controllers for testing.
- **RSpec-Rails** (`rspec-rails`): Testing framework for Rails applications.
- **VCR** (`vcr`): Records HTTP interactions for fast, deterministic tests.
- **WebMock** (`webmock`): Library for stubbing and setting expectations on HTTP requests.

#### Test

- **Capybara** (`capybara`): Acceptance test framework for web applications.
- **Selenium WebDriver** (`selenium-webdriver`): Allows for browser automation.

### Additional Tools

- **Faraday** (`faraday`): HTTP client library that provides a common interface over many adapters and embraces the concept of middleware.
- **GraphiQL-Rails** (`graphiql-rails`, development group): An in-browser IDE for exploring GraphQL APIs.
- **GraphQL** (`graphql`): A query language for APIs and a runtime for executing those queries.

### Code Quality and Linting

- **Dotenv** (`dotenv`): Loads environment variables from `.env` into `ENV`.
- **RuboCop** (`rubocop`, `rubocop-capybara`, `rubocop-graphql`, `rubocop-rails`, `rubocop-rspec`): Ruby static code analyzer and formatter that helps enforce code style guidelines.

These dependencies collectively help build, test, and maintain the application while ensuring code quality, security, and optimal performance.

## Technical Details:
- **GraphQL**: Utilizes graphql-ruby to handle requests to the GitHub API.
- **Testing**: Code is covered by tests using rspec-rails. vcr is used for request stabilization.
- **Linters**: Utilizes rubocop for code quality checks.
- **GitHub Flow**: Adheres to GitHub Flow for development, collaboration, and releases.
- **Deployment**: The application deployed on Heroku.





