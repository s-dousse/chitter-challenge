require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONEMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_app_test')
    else
      con = PG.connect(dbname: 'chitter_app_test')
    end

    rs = con.exec("SELECT * FROM peeps")
    rs.map { |peep| peep['content'].to_s }
  end
end