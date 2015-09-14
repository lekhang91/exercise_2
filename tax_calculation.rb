class TaxCalculation
	def initialize arr_product
		@arr_product = arr_product
	end
	def total_tax(arr_product)
		total_tax_fee = 0
		arr_product.each do |item|
			total_tax_fee += (item.tax_fee * item.quantity)
		end
		total_tax_fee
	end

	def product_tax(arr_product)
		total = total_tax(arr_product)
		arr_product.each do |item|
			total += (item.quantity * item.price)
		end
		total
	end
end

# puts "Total tax fee: #{total_tax(arr_product)}$"
# puts "Total: #{product_tax(arr_product)}$"