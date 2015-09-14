class Product_detail
	attr_reader :quantity, :product, :price, :tax_fee
	@@medicine = ["flu", "headache", "sick", "stomach", "pain", "cancer", "ill", "medicine"]
	@@food = ["meat", "milk", "rice", "fish", "potato", "tomato", "water", "vesgetable", "food", "cereal"]
	@@book = ["book", "author", "poem", "story"]
	def initialize(product, quantity, price)
		@product = product
		@quantity = quantity
		@price = price
		@tax_fee = (@price * after_tax - @price).round(2)
	end

	def display_detail
		"Product: #{@product}\n Quantity: #{@quantity} - Price: #{@price}$ - Tax fee for 1 prodcut: #{@tax_fee}\n\n"
	end

	def after_tax
		tax_fee = 1.1
		@@medicine.each do |item|
			if @product.downcase.include?item
				tax_fee = 1
			end
		end
		@@book.each do |item|
			if @product.downcase.include?item
				tax_fee = 1
			end
		end
		@@food.each do |item|
			if @product.downcase.include?item
				tax_fee = 1
			end
		end
		if @product.downcase.include?"imported"
			tax_fee = 1.15
		end
		tax_fee
	end
end