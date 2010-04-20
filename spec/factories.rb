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

Factory.define :atleta, :class => User do |user|
  user.email "omar@gmail.com"
  user.name "omar"
  user.password "123456"
  user.password_confirmation "123456"
  user.atleta true
  user.treinador false
  user.activated true
  user.treinador_id { x = Factory(:treinador); x.id } 
end

Factory.define :treino do |treino|
  treino.date Time.now
  treino.text "aaaa"
  treino.comentario "bbbb"
  treino.atleta { x = Factory(:atleta); Atleta.find_by_user_id(x.id) }  
end
