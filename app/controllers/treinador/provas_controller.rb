class Treinador::ProvasController < ApplicationController
  
  before_filter :require_login

	def show
		@atleta = Atleta.find(params[:atleta_id])
		@prova = Prova.find(params[:id])
	end
	
	def index
		@atleta = Atleta.find(params[:atleta_id])	
	end
end
