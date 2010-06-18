class Treinador::ProfilesController < ApplicationController
	def show
		@treinador = Treinador.find(current_treinador)
	end
end
