Factory.define :user do |user|
  user.email "krynble@gmail.com"
  user.name "omar"
  user.password "123456"
  user.password_confirmation "123456"
  user.atleta true
  user.treinador false
end
