# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Belay Birhanu', email: 'belay@gmail.com', password: '123456',
  password_confirmation: '123456')

second_user = User.create(name: 'Giovanni Juliao', email: 'giovani@gmail.com', password: '123456',
  password_confirmation: '123456')

third_user = User.create(name: 'Diego C', email: 'diego@gmail.com', password: '123456',
  password_confirmation: '123456')

fourth_user = User.create(name: 'Paul S', email: 'paul@gmail.com', password: '123456',
  password_confirmation: '123456')

# Seed some Cars for testing purposes
first_car = Car.create(
  model: '2018 Jaguar F-Type Coupe',
  image: 'https://simaautoservice.se/wp-content/uploads/2021/07/car-image-transparent-background-8.png',
  description: 'The 2018 Jaguar F-Type Coupe is a luxury sports car that boasts sleek and stylish design, \
    exceptional performance, and advanced technology features.\n\nUnder the hood, it has a range of engine \
    options, including a base 2.0-liter turbocharged four-cylinder engine that produces 296 horsepower \
    and 295 lb-ft of torque, a 3.0-liter supercharged V6 engine that delivers 340 horsepower and 332 \
    lb-ft of torque, and a top-of-the-line 5.0-liter supercharged V8 engine that generates 575 horsepower \
    and 516 lb-ft of torque.',
  price: 550,
  brand: 'Land Rover',
  year: '2018-01-01',
  color: 'Gray',
  is_electric: false,
  accidents: 0
)

second_car = Car.create(
  model: '2020 Jaguar F-Type Coupe',
  image: 'https://carprices.ae/wp-content/uploads/2022/04/2021-Jaguar-F-Type-Coupe-Banner.png',
  description: 'The 2020 Jaguar F-Type Coupe is a luxurious and sporty two-door coupe that exudes elegance and \
  high performance.\n\nThe car is equipped with a range of powertrain options, including a base 2.0-liter \
  turbocharged four-cylinder engine that produces 296 horsepower and 295 lb-ft of torque, a 3.0-liter supercharged \
  V6 engine that delivers 340 horsepower and 332 lb-ft of torque, and a top-of-the-line 5.0-liter supercharged V8 \
  engine that generates 575 horsepower and 516 lb-ft of torque. The engines are mated with an eight-speed automatic \
  transmission, which can be controlled via paddle shifters mounted on the steering wheel.',
  price: 650,
  brand: 'Land Rover',
  year: '2020-01-01',
  color: 'Light gray',
  is_electric: true,
  accidents: 0
)

third_car = Car.create(
  model: '2010 Audi TT RS Coupe',
  image: 'https://www.freepnglogos.com/uploads/car-png/car-png-large-images-40.png',
  description: 'The 2010 Audi TT RS Coupe is a high-performance sports car that delivers an exhilarating driving 
    experience. It is powered by a 2.5-liter five-cylinder engine that produces an impressive 335 horsepower and 
    332 lb-ft of torque. This engine is paired with a six-speed manual transmission and all-wheel drive, providing 
    excellent handling and grip on the road.\n\nThe exterior of the TT RS Coupe is sleek and stylish, with a low 
    profile and a distinctive front grille. Inside, the cabin is well-appointed with high-quality materials and 
    advanced technology. Standard features include leather upholstery, automatic climate control, and a premium audio system.',
  price: 450,
  brand: 'Audi',
  year: '2010-01-01',
  color: 'Red',
  is_electric: false,
  accidents: 1
)

fourth_car = Car.create(
  model: '2014 VW Beetle Dune',
  image: 'https://i.pinimg.com/originals/60/c6/05/60c6052cecf20a380007a5b1be98b68f.png',
  description: 'The 2014 VW Beetle Dune is a special edition of the iconic VW Beetle that offers a unique and 
    distinctive look. The Dune is inspired by the classic Baja Bugs, which were popular in off-road racing in 
    the 1960s and 1970s. The Dune has a raised ride height, wider body, and unique front and rear bumpers, 
    giving it a rugged and sporty appearance.',
  price: 350,
  brand: 'VolksWagen',
  year: '2014-01-01',
  color: 'Yellow',
  is_electric: false,
  accidents: 0
)

fifth_car = Car.create(
  model: '2004 Hummer H2',
  image: 'https://www.freepngimg.com/thumb/car/31469-4-car-transparent-image.png',
  description: 'The 2014 VW Beetle Dune is a special edition of the iconic VW Beetle that offers a unique and 
    distinctive look. The Dune is inspired by the classic Baja Bugs, which were popular in off-road racing in 
    the 1960s and 1970s. The Dune has a raised ride height, wider body, and unique front and rear bumpers, 
    giving it a rugged and sporty appearance.',
  price: 1000,
  brand: 'Hummer',
  year: '2004-01-01',
  color: 'Victory red',
  is_electric: false,
  accidents: 0
)

sixth_car = Car.create(
  model: '2015 Audi Sport Quattro',
  image: 'https://purepng.com/public/uploads/large/purepng.com-yellow-audi-caraudicars-961524670899johme.png',
  description: 'he 2015 Audi Sport Quattro is a high-performance sports car that offers a thrilling driving 
    experience. It is powered by a 4.0-liter turbocharged V8 engine that produces an impressive 552 horsepower 
    and 516 lb-ft of torque. This engine is paired with an eight-speed automatic transmission and all-wheel drive, 
    providing excellent handling and acceleration on the road.',
  price: 700,
  brand: 'Audi',
  year: '2015-01-01',
  color: 'Yellow',
  is_electric: false,
  accidents: 0
)

# Create some reservations for each car
users = [first_user, second_user, third_user, fourth_user]
cars = [first_car, second_car, third_car, fourth_car, fifth_car, sixth_car]

cars.each do |car|
  # Generate 3-5 random reservations for each car
  start_date = Date.today
  num_reservations = rand(3..5)
  num_reservations.times do
    # Generate random start and return dates
    start_date += rand(1.day..5.days)
    return_date = start_date + rand(1.day..5.days)

    # Create a reservation for a random user and the current car
    Reservation.create(start_date: start_date, return_date: return_date, user: users.sample, car: car)
    start_date = return_date
  end
end