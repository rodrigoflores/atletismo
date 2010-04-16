Factory.define :user do |user|
  user.email "krynble@gmail.com"
  user.name "omar"
  user.password "123456"
  user.password_confirmation "123456"
  user.atleta true
  user.treinador false
  user.activated true
end

Factory.define :treinador, :class => User do |user|
  user.email "krynble@gmail.com"
  user.name "omar"
  user.password "123456"
  user.password_confirmation "123456"
  user.atleta false
  user.treinador true
  user.activated true
end
