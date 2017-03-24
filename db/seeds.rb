# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# files = Dir.glob("#{Rails.root}/app/assets/images/cars/**/*")
# files.each do |file|
#   base_name = Pathname.new(file).basename
#   file_name = base_name.to_s.split('.')[0]
#   car = Car.find_by_vin(file_name.to_s)
#   unless car.nil?
#     car.update_attributes(car_image: base_name)
#   end
# end

unless Admin.find_by_email('phanchanry89@gmail.com')
  admin = Admin.create(
      first_name:'phan',
      last_name: 'chanry',
      email: 'phanchanry89@gmail.com',
      password: 'flygare10'
  )
  admin.save!
end
