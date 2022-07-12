require 'rails_helper'

RSpec.describe SearchCep, type: :service do
  describe '#call' do
    context 'should be valid', :vcr do
      it "when has the right length of zipcode" do
        input = '04843-425'
        response = SearchCep.call(input: input)
        expect(response).to include(:neighborhood => "Parque São José", :state => "SP", :street => "Viela 16", :zipcode => "04843425")
      end
    end
    
    context 'should be invalid', :vcr do
      it 'when the zipcode length is wrong' do
        input = '04843-42'
        response = SearchCep.call(input: input)
        expect(response).to include(valid: false, message: "Tamanho incorreto de cep")
      end

      it 'when the zipcode is not valid' do
        input = '99999-111'
        response = SearchCep.call(input: input)
        expect(response).to include(valid: false, message: "Não é um cep válido")
      end
    end
  end
end