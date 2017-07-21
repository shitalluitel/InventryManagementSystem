namespace :db do
  desc "Add the default user"
  task :default_user => :environment do
    User.create(first_name:'test',last_name:'test',email: 'test@insys.com', password: 'test123')
  end

  desc "Create the default customer"
  task :default_customer => :environment do
    Customer.create(customer_name: 'Cash', address: "-", phone_number: '-')
  end

  desc "Create the default vendor"
  task :default_vendor => :environment do
    Customer.create(customer_name: 'Cash', address: "-", phone_number: '-')
  end

  desc "Create the default company profile"
  task :default_company_profile => :environment do
    CompanyProfile.create(name: 'XYZ', address: '-', phone: '-', vat_pan_no: '123', district: '-', ward_no: '-',vdc_mun:'-',tax:'13',zone: '-',userid:'1', email: 'info@xyz.com', )
  end

  desc "Run all db tasks"
  task :all => [:default_user, :default_customer, :default_vendor, :default_company_profile]
end
