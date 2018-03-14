if ENV['ENVIROMENT'] == 'test'
  connection = PG.connect(dbname: 'bookmark_manager_test')
else
  connection = PG.connect(dbname: 'bookmark_manager')
end
