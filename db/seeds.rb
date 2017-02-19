# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.apiKey ="1664aef69ceda3fd67a460ffd9813427"
3.times do |j|
  title = "Test Cause " + j.to_s
  resp = Customer.createCustomer(
  {
      "first_name": "Test Case",
      "last_name": j.to_s,
      "address": {
          "street_number": "Test street number",
          "street_name": "Test street name",
          "city": "Test City",
          "state": "MD",
          "zip": "21014"
      }
  })
  id = resp["objectCreated"]["_id"]
  ac_num = 16.times.map{rand(10)}.join
  resp = Account.createAccount(id,
                    {"type": "Credit Card",
                    "nickname": title,
                    "rewards": 0,
                    "balance": 200,
                    "account_number": ac_num})
  accid = resp["objectCreated"]["_id"]
  c = Cause.create(title:title, accid: accid)

  15.times do
    name=Faker::Name.name
    email=Faker::Internet.email
    c.users.create(name:name, email:email)
  end

  10.times do |i|
    title = "Payment number " + i.to_s + " of cause " + c.title
    amount = rand * 100
    content = Faker::Lorem.sentence(5)
    p = c.payments.create(title:title, amt:amount, desc:content)
  end
end