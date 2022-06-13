puts "Cadastrando Students..."
10.times do |i|
  Student.create!(
    name: Faker::Name.unique.name,
    cpf: Faker::CPF.pretty,
    birthdate: Faker::Date.between(from: '1960-01-01', to: '2010-01-01'),
    payment_method: ['Boleto', 'Cartão de Crédito'].sample
  )
end
puts "Students cadastrados."