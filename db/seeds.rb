# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed some Cars for testing purposes
Car.create(model: 'Camry',
  image: 'https://www.toyota.com/imgix/responsive/images/mlp/colorizer/2021/camry/1H1/1.png?q=85&fm=jpg&w=1024&fit=max&cs=strip&bg=fff',
  description: 'If you\'re looking for a reliable, comfortable and spacious car, look no further than the Toyota \
    Camry. The Camry is one of the best-selling sedans in the world, and for good reason. It offers a smooth ride, \
    a spacious interior, and a range of features to suit your needs. Whether you need a car for commuting, family \
    trips, or weekend adventures, the Camry has you covered. The Camry is also fuel-efficient, safe and durable, \
    making it a smart choice for any driver. Don\'t miss this opportunity to own a Toyota Camry today!',
  price: 25000,
  brand: 'Toyota',
  year: '2019-01-01',
  color: 'White',
  is_electric: false,
  accidents: 0
)

Car.create(model: 'Model S',
  image: 'https://www.tesla.com/xNVh4yUEc3B9/04_Desktop.jpg',
  description: 'Experience unparalleled performance with the 2022 Tesla Model S. With its all-electric powertrain \
    and cutting-edge technology, the Model S can accelerate from 0 to 60 mph in just 1.98 seconds. The spacious \
    interior is designed for comfort and convenience, with a 17-inch touchscreen display, premium sound system, \
    and advanced driver assistance features. Plus, with a range of up to 405 miles on a single charge, the Model S \
    is perfect for long road trips. Don\'t settle for less than the best - choose the 2022 Tesla Model S today!',
  price: 79990,
  brand: 'Tesla',
  year: '2022-01-01',
  color: 'Black',
  is_electric: true,
  accidents: 0
)

Car.create(model: 'Mustang',
  image: 'https://www.ford.com/cmslibs/content/dam/vdm_ford/live/en_us/ford/nameplate/mustang/2021/collections/billboards/3_2/21_FRD_MST_1280x853_O.jpg/_jcr_content/renditions/cq5dam.web.1280.1280.jpeg',
  description: 'Get ready to feel the power of the 2021 Ford Mustang. With its classic styling, powerful engine, and \
    advanced technology, the Mustang is a true American icon. Choose from a range of engines, including the 5.0L V8, \
    and enjoy up to 480 horsepower and 420 lb.-ft. of torque. The Mustang also features advanced driver assistance \
    features, including lane departure warning and adaptive cruise control, to keep you safe on the road. Don\'t \
    settle for a boring car - get behind the wheel of the 2021 Ford Mustang today!',
  price: 32500,
  brand: 'Ford',
  year: '2021-01-01',
  color: 'Red',
  is_electric: false,
  accidents: 1
)

Car.create(model: 'Civic',
  image: 'https://automobiles.honda.com/-/media/Honda-Automobiles/Vehicles/2020/Civic-Sedan/2020_Honda_Civic_Sedan_Si_Hero_V3.jpg?h=675&w=1200&la=en&hash=FFB4D3C4A210B147E9B96A0A3E174CF94FA658E5',
  description: 'Drive with confidence in the 2020 Honda Civic. This compact car offers a comfortable and spacious \
    interior, a fuel-efficient engine, and advanced safety features to keep you and your passengers safe. Choose \
    from a range of trims, including the sporty Si model, and enjoy features like Apple CarPlay, Android Auto, and \
    Honda Sensing technology. With its sleek design and reliable performance, the Honda Civic is the perfect car \
    for anyone who wants to enjoy the ride. Don\'t wait - test drive the 2020 Honda Civic today!',
  price: 22500,
  brand: 'Honda',
  year: '2020-01-01',
  color: 'Blue',
  is_electric: false,
  accidents: 0
)
