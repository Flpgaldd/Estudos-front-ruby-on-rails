require 'net/http'
require 'httparty'
require 'pry'
class CarrosController < ApplicationController
  def index
    url = URI ('http://localhost:3000/carros')
    response = Net::HTTP.get(url)

    data = JSON.parse(response)

    # Converter cada hash em um objeto Carro
    @carros = data.map { |carro_data| Carro.new(carro_data) }

  end

  def show
    url = URI ("http://localhost:3000/carros/#{params['id']}")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    # Converter cada hash em um objeto Carro
    @carro = Carro.new(data)
  end

  def new
    begin
      url = URI ('http://localhost:3000/fabricantes')
      response = Net::HTTP.get(url)
      data = JSON.parse(response)

      @fabricantes= data.map {|fabricante_data| Fabricante.new(fabricante_data)}
    rescue StandardError=> e
      @fabricantes=[]
    end
    @carros= Carro.new

  end

  def create

    body ={
      "nome": params["nome"],
      "informacao": params["informacao"],
      "ano":  params["ano"],
      "portas":  params["portas"],
      "portamalas":  params["portamalas"],
      "arcondicionado":  params["arcondicionado"],
      "lugares":  params["lugares"],
      "fabricante_id":  params["fabricante_id"]
    }
    begin
      response = HTTParty.post('http://localhost:3000/carros',
      body: body.to_json,
      headers: { 'Content-Type' => 'application/json' })

      if response.code == 201
        redirect_to carro_path(JSON.parse(response.body)['id']), notice: "Carro criado com sucesso!!"
      else
        redirect_to new_carro_url, notice: "Não foi possivel criar o carro"
      end
    rescue StandardError=> e
      redirect_to new_carro_url, notice: "Não foi possivel criar o carro"
    end

  end


  def update
  end

end
