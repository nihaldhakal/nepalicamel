		# This file should contain all the record creation needed to seed the database with its default values.
		# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
		#
		# Examples:
		#
		#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
		#   Character.create(name: 'Luke', movie: movies.first)


		(1..10).each do |index|
			new_user = User.new
			new_user.email = "#{index}@gmail.com.tdlr"
			new_user.password = "abcdef"
			new_user.password_confirmation = "abcdef"
			new_user.save!
		end

		User.all.each do |user|
			(1..5).each do |index|
				Product.create!({
																		name: "Product name #{index}",
																		url: "http://www.somestore#{index}.com",
																		image_url: "http://lorempixel.com/400/200",
																		user_id: user.id
																})
			end
    end

    Product.all.each do |product|
      (1..rand(5..10)).each do |counter_x|
        reference_date = 10.days.ago
        (1..counter_x).each do |counter_y|
          date = reference_date + counter_y
					new_pricehistory = Pricehistory.new
          new_pricehistory.date = date
          new_pricehistory.price = counter_y + counter_y * rand(1..10) / 100.0
          new_pricehistory.product_id = product.id
          new_pricehistory.save!

        end
      end
    end

