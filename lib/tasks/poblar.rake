namespace :db do
	desc "Agrega datos aleatorios a la base de datos."
	task poblar: :environment do
		#Crea 10 usuarios de prueba
		10.times do |n|
			puts "[DEBUG] Creando usuario #{n+1} de 10}"
			name = Faker::Name.name
			email = "user-#{n+1}@test.com"
			password = "holahola123"
			User.create!(
					name: name,
					email: email,
					password: password,
					password_confirmation: password
				)
		end
		#Crea recursos para cada usuario creado
		User.all.each do |user|
			puts "[DEBUG] Creando imágenes para el usuario #{user.id} de #{User.last.id}"
			10.times do |n|
				image = File.open(Dir.glob(File.join(Rails.root, "recursosTest", "*")).sample)
				description = %w(Genial Estupendo Sorprendente Grandioso Lindo Hermoso).sample

				user.pins.create!(image: image, description: description)
			end
		end
	end
end