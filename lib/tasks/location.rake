require 'csv'
namespace :location do
  desc "Import gac from csv file"
  task :import => [:environment] do

    file_state = "vendor/data/location/GeoPC_AT_State.csv"
    csv_text = File.read(file_state)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      Location::State.create! ({
          :language => row[:Language],
          :code => row[:State_id],
          :name => row[:State],
      })
    end

    file_region = "vendor/data/location/GeoPC_AT_Region.csv"
    csv_text = File.read(file_region)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      Location::Region.create!({
                                   :code => row[:Region_id],
                                   :name => row[:Region],
                                   :state_code => row[:State_id]
                               })
    end

    file_place= "vendor/data/location/GeoPC_AT_Place.csv"
    csv_text = File.read(file_place)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      Location::Place.create!({
                                  :code => row[:ZIP],
                                  :name => row[:City],
                                  :region_code => row[:Region_id]
                              })
    end
  end
end