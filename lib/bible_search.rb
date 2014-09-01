class BibleSearch
  require 'HTTParty'

  def self.versions_list
    auth = {:username => ENV['BIBLESEARCH_KEY'], :password => ENV['BIBLESEARCH_PASSWORD']}
    response = HTTParty.get("https://bibles.org/v2/versions.js", :basic_auth => auth)
    response_hash = ActiveSupport::JSON.decode(response)
    
    versions = Array.new 

    response_hash["response"]["versions"].each do |version| 
      versions << version["name"]  
    end

    return versions
  end
end
