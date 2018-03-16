require 'pg'
require 'uri'
require_relative './database_connection'

class Link
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add(url, title)
    if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      DatabaseConnection.query("INSERT INTO links(url, title) VALUES('#{url}', '#{title}')")
    end
  end
end
