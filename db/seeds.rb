# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name:'test',last_name:'test',email: 'test@insys.com', password: 'test123')
Customer.create(customer_name: 'cash', address: '-', phone_number: '-')
Vendor.create(name: 'cash', address: '-', phone_no: '-')
CompanyProfile.create(name: 'XYZ', address: '-', phone: '-', vat_pan_no: '123', district: '-', ward_no: '-',vdc_mun:'-',tax:'13',zone: '-', email: 'info@xyz.com', )