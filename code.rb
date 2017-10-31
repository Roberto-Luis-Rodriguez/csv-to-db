require 'pg'
require 'csv'

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach('ingredients.csv', headers: true) do |row|
  db_connection do |conn|
    insert_ingredients = "INSERT INTO ingredients (step, name) VALUES ($1, $2)"
    values = [row['step'], row['name']]
    conn.exec_params(insert_ingredients, values)
  end
end

select_ingredients = "SELECT * FROM ingredients"
ingredients = db_connection  do |conn|
  conn.exec(select_ingredients)
end

ingredients.to_a.each do |ingredient|
  puts "#{ingredient["step"]}. #{ingredient["name"]}"
end 
