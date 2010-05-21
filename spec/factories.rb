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
  user.email "krynble@yahoo.com"
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
  treino.date Date.new
  treino.text "aaaa"
  treino.comentario "bbbb"
  treino.atleta { x = Factory(:atleta); Atleta.find_by_user_id(x.id) } 
end

Factory.define :item_treino do |item_treino|
  item_treino.treino { |x| x.association(:treino)} 
  item_treino.objetivo "Força"
  item_treino.series 12
  item_treino.repeticao 5
  item_treino.volume   10
  item_treino.grandeza "m"
  item_treino.exercicio "Polichinelo"
  item_treino.intervalo 100
  item_treino.pausa     10  

end


Factory.define :prova, :class => Prova do |provas|
  provas.data Date.new
  provas.competicao "Meia Maratona"
  provas.atleta_id 1
  provas.created_at Date.new
  provas.updated_at Date.new
  provas.segundos 47
  provas.minutos 9
  provas.decimos 3
  provas.clima "Nublado"
  provas.distancia 10.4
  provas.tipoTempo "seco"
  provas.comentarios "suave"
  provas.colocacao 715627
  provas.horas 8
  provas.cor_periodo_id 1
end

Factory.define :cor_periodo do |cor|
  cor.treinador_id 1
  cor.cor "FFFFFF"
  cor.periodo "treinamento"
  cor.inicio Date.new
  cor.fim Date.new
end

Factory.define :cor_treino do |cor|
  cor.treinador_id 1
  cor.cor "preto e branco"
  cor.tipo "corrida"
end

Factory.define :teste, :class => Teste do |t|
  t.atleta_id 1
  t.nome "O mar"
  t.data Date.new
  t.minutos 10
  t.segundos 10
  t.decimos 9
  t.metros 10
  t.centimetros 10
  t.kg 0.2
  t.clima "frio"
  t.periodo "periodo"
  t.comentarios "comentario"
  t.created_at Date.new
  t.updated_at Date.new
end
