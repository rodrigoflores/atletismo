class Atleta::ProvasController < ApplicationController

  before_filter :require_login

	def index
		@atleta = Atleta.find(current_user.atleta_id)
	end

	def show
		@atleta = Atleta.find(current_user.atleta_id)
		@prova = Prova.find(params[:id])
	end

	def new
		@atleta = Atleta.find(current_user.atleta_id)
		@prova = Prova.new
	end

	def create
		@atleta = Atleta.find(current_user.atleta_id)
		@prova = Prova.new(params[:prova])

		@prova.atleta_id = @atleta.id
		if @prova.save
			flash[:notice] = "Prova foi criada com sucesso."
			@provas = Prova.find(:all, :conditions => {:atleta_id => @prova.atleta_id})
			redirect_to atleta_provas_path
		else
			render 'new'
		end
	end

	def edit
		@atleta = Atleta.find(current_user.atleta_id)
		@prova = Prova.find(params[:id])
	end

	def update
		@prova = Prova.find(params[:id])
		if @prova.update_attributes(params[:prova])
			flash[:notice] = 'Prova foi atualizada com sucesso.'
			redirect_to atleta_provas_path
		else
			render 'edit'
		end
	end

end
