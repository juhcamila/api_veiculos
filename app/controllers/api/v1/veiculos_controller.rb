class Api::V1::VeiculosController < ApplicationController

  #listar todos
  def index
    veiculos = Veiculo.all.order(created_at: :desc)
    render json: {staus: 'Success', message: "Visualização de veiculos", data: veiculos}, status: :ok
  end

  #listar por id
  def show
    veiculo = Veiculo.find(params[:id])
    render json: {staus: 'Success', message: "Show Veiculo", data: veiculo}, status: :ok
  end

  #criar veiculo
  def create
    veiculo = Veiculo.new(veiculo_params)
    if veiculo.save
      render json: {status: 'success', message:'Veiculo criado com sucesso!', data: veiculo}, status: :ok
    else
      render json: {status: 'error', message:'Ocorreu um erro ao criar o veiculo', data: veiculo.errors}, status: :unprocessable_entity
    end
  end

  #alterar veiculo
  def update
    veiculo = Veiculo.find(params[:id])
    if veiculo.update_attributes(veiculo_params)
      render json: {status: 'success', message:'Veiculo alterado com sucesso!', data: veiculo}, status: :ok
    else
      render json: {status: 'error', message:'Ocorreu um erro ao alterar o veiculo', data:veiculo.errors}, status: :unprocessable_entity
    end
  end

  #apagar veiculo
  def destroy
    veiculo = Veiculo.find(params[:id])
    veiculo.destroy
    render json: {status: 'success', message:'Veiculo deletado com sucesso!', data: veiculo}, status: :ok
  end

  private

  def veiculo_params
    params.permit(:marca, :veiculo, :ano, :descricao, :vendido)
  end
end