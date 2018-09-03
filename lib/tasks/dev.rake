namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    kinds = %w[Amigo Comercial Conhecido]
    kinds.each do |kind|
      Kind.create!(
        description: kind,
      )
    end

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        Phone.create!(number: Faker::PhoneNumber.cell_phone, contact: contact)
      end
    end

    Contact.all.each do |contact|
      Address.create!(street: Faker::Address.street_address,
                      city: Faker::Address.city,
                      contact: contact)
    end
  end
end
