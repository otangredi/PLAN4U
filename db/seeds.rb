puts 'Creating user account...'
  user = User.new(
    email: "oliviatangredixo@gmail.com",
    password: "123456",
    last_name: "Tangredi",
    first_name: "Olivia"
  )
  user.save!
  user = User.new(
    email: "dreijanuar@gmail.com",
    password: "123456",
    last_name: "Kwon",
    first_name: "Bie"
  )
  user.save!
  user = User.new(
    email: "anthonyborremans@hotmail.com",
    password: "123456",
    last_name: "Borremans",
    first_name: "Anthony"
  )
  user.save!
puts 'users accounts create'
