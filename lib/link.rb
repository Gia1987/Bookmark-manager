require 'pg'

class Link
  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| link['url'] }
  end

  def self.add(url)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{url}')")
    end
end
