require 'database_connection'
describe DatabaseConnection do

  describe'.setup' do
    it'setup a new connection with the database provided' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
    it 'show the connection is persistant' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
  
  describe'.query' do
    it 'use an instance variable for set up' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM links;')
      DatabaseConnection.query('SELECT * FROM links;')
    end
  end
end
