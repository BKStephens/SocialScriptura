class BibleSearch
  require 'HTTParty'

  def versions_list
    auth = {:username => ENV['BIBLESEARCH_KEY'], :password => ENV['BIBLESEARCH_PASSWORD']}
    response = HTTParty.get("https://bibles.org/v2/versions.js", :basic_auth => auth)
    versions = response.parsed_response
  end
end
