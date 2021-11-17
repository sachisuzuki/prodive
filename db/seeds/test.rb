# frozen_string_literal: true

require 'csv'

# Divesites
CSV.foreach('db/Divesite.csv', headers: true) do |row|
  Divesite.create(area: row[0].to_i,
                  zone: row[1].to_i,
                  name: row[2],
                  address: row[3],
                  phone: row[4],
                  service: row[5],
                  discription: row[6],
                  latitude: row[7],
                  longitude: row[8])
end
