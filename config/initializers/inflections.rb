# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
    inflect.plural /^([a-zA-z]*)r$/i, '\1res'
    inflect.singular /^([a-zA-z]*)res$/i, '\1r'
    inflect.irregular 'user', 'users'
    inflect.irregular 'item_treino', 'itens_treino'
    inflect.irregular 'teste', 'testes'
    inflect.irregular 'prova_que_participa', 'provas_que_participa'

end
