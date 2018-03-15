require 'pg'
require 'uri'
require_relative './database_connection'

class Link
  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| link['url'] }
  end

  def self.add(url)
    if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      DatabaseConnection.query("INSERT INTO links(url) VALUES('#{url}')")
    end
  end
end
