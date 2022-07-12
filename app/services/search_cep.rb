require 'net/http'
require 'uri'

class SearchCep < Main
  attr_reader :input

  def initialize(input:)
    @input = input
  end

  def call
    return { valid: false, message: "Tamanho incorreto de cep" } unless valid?

    uri = URI("https://viacep.com.br/ws/#{sanitized_input}/json/")
    obj = Net::HTTP.get_response(uri)

    response = obj.body
    response = JSON.parse(response) if response.is_a?(String)

    return { valid: false, message: "Não é um cep válido" } if response["erro"]

    {
      zipcode: sanitized_input,
      street: response["logradouro"],
      neighborhood: response["bairro"],
      state: response["uf"]
    }
  end

  private

  def sanitized_input
    input.gsub(/[^\d+]/, '')
  end

  def valid?
    sanitized_input.length == 8
  end
end