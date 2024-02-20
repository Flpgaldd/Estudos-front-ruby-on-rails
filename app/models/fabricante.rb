class Fabricante
  attr_accessor :id, :nome

  def initialize(attributes = {})
    @id = attributes['id']
    @nome = attributes['nome']
  end
end
