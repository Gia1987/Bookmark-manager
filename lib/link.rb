require 'pg'
require 'uri'
require_relative './database_connection'

class Link
  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| link['url'] }
  end

  def self.add(url)
    # if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
    result = DatabaseConnection.query("INSERT INTO links(url) VALUES('#{url}')")
    # else
      # p 'Sorry this is not a website'
    # end
  end
end
