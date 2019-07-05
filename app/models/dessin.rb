class Dessin
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect({:host => "localhost", :port => 5432, :dbname => "d3ssins-backend_development"})
  end

  def self.all
    results = DB.exec("SELECT * FROM dessins_data;")
    return results.map do |result|
      {
        "name" => result["name"],
        "parents" => result["parents"],
        "children" => result["children"]
      }
    end
  end
end
