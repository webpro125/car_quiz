require 'csv'
class Car < ApplicationRecord
  enum wd: [ '4WD', '2WD' ]

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # do |user|
      #   user.first_name = row["Choose User"].split("@").first
      #   user.last_name = 'temp'
      #   user.password = Devise.friendly_token.first(8)
      #   user.skip_confirmation!
      # end

      car = Car.new(
            zip_code: row['Zip Code'],
            year: row['Year'],
            model: row['Model'],
            color: row['Color'],
            vin: row['VIN'],
            mileage: row['Mileage'],
            price: row['Price'],
            days_to_sell: row['Days to Sell'],
            seat_number: row['Number of Seat'],
            vehicle_type: row['Type of Vehicle'],
            wd: row['4WD or 2WD'],
            car_type: row['auto or Manual'],
      )

      next unless car.save
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
