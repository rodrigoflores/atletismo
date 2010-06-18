class Atleta::ProfilesController < ApplicationController

	def show
		@atleta = Atleta.find(current_atleta)
	end
	
	def edit
		@atleta = Atleta.find(current_atleta)
		@treinadores = Treinador.all
	end
	
	def update
		@atleta = Atleta.find(current_atleta)
		if @atleta.update_atleta(params[:atleta])
			flash[:notice] = "Atualização realizada com sucesso!"
			redirect_to atleta_profile_path
		else
			render "edit"
		end
	end
end
