class Treinador::ObjetivosController < ApplicationController

  before_filter :require_login

  def index
    @user = User.find(current_user)
    @treinador = Treinador.find_by_user_id(@user)
    @objetivos = Objetivo.find_all_by_treinador_id(@treinador)
  end

  def edit
    @objetivo = Objetivo.find_by_id(params[:id])
  end

  def update
    @objetivo = Objetivo.find_by_id(params[:id])
    @objetivo.nome = params[:objetivo][:nome]

    if(@objetivo.save)
      redirect_to treinador_objetivos_path
    else
      render "edit"
    end
  end

  def new

  end

  def create
    @objetivo = Objetivo.new(params[:objetivo])
    @objetivo.treinador_id = Treinador.find(current_user.treinador_id).id
    if @objetivo.save
      redirect_to treinador_objetivos_path
    else
      render "new"
    end
  end
end
