user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

cities_list = [
  ["New York", "NY"],
  ["London", "LDN"],
  ["Los Angeles", "LA"],
  ["Warsaw", "War"],
  ["Rzeszów", "War"],
  ["Rome", "Rome"],
  ["Madrid", "Mad"],
]

cities_list.each do |name, short_name|
  City.create(name: name, short_name: short_name)
end

User.create(email: 'user@email.com', password: 'qwerty123')
User.create(email: 'johnnydeep@email.com', password: 'qwerty123', name: 'Johnny', age: '35', city_id: 1)