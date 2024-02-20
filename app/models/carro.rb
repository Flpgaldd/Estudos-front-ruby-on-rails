require 'pry'
class Carro
  attr_accessor :id, :nome, :informacao, :ano, :portas, :portamalas, :arcondicionado, :lugares, :created_at, :fabricante

  def initialize(attributes = {})
    @id = attributes['id'].to_i
    @nome = attributes['nome']
    @informacao = attributes['informacao']
    @ano = attributes['ano']
    @portas = attributes['portas']
    @portamalas = attributes['portamalas']
    @arcondicionado = attributes['arcondicionado']
    @lugares = attributes['lugares']
    @created_at = attributes['created_at']
    @fabricante = Fabricante.new(attributes['fabricante']) if attributes['fabricante']
  end
end
