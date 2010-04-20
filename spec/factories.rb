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

