require 'httparty'

def fetch_repo(username)
  url = "https://api.github.com/users/#{username}/repos"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def analyze_repositories(repositories)
  most_starred_repo = repositories.max_by { |repo| repo['stargazers_count'] }
  { name: most_starred_repo['name'],
    description: most_starred_repo['description'],
    stars: most_starred_repo['stargazers_count'],
    url: most_starred_repo['html_url'] }
end

def display_most_starred_repository(repo)
  puts "Name: #{repo[:name]}"
  puts "Description: #{repo[:description]}"
  puts "Stars: #{repo[:stars]}"
  puts "URL: #{repo[:url]}"
end

# Example usage
username = 'daltonmann'
repositories = fetch_repo(username)
most_starred_repo = analyze_repositories(repositories)
puts "___Most Starred Repository of #{username}___"
display_most_starred_repository(most_starred_repo)
