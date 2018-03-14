require'./lib/database_connection'
if ENV['ENVIROMENT'] == 'test'
   DatabaseConnection.setup('bookmark_manager_test')
   # connection = PG.connect(dbname: 'bookmark_manager_test')
else
   DatabaseConnection.setup('bookmark_manager')
   # connection = PG.connect(dbname: 'bookmark_manager')
end
