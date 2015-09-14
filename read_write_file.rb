require './product_detail'
require './tax_calculation'
class Txtfile
	def initialize file_name
		@file_name = file_name
	end

	def read_input_file
		file_input = File.open(@file_name, "r")
		arr_product = Array.new
		if file_input
			file_input.each_line do |line|
				split_arr = line.split(',')
				product = Product_detail.new(split_arr[0], split_arr[1].to_i, split_arr[2].to_i)
				arr_product << product
			end
		else 
			puts "Can't open file!"
		end
		file_input.close
		arr_product
	end

	def write_output_file arr_product, tax_calcul
		file_output = File.open(@file_name, "w")
		if file_output
			arr_product.each do |product|
				file_output.puts product.display_detail
			end
		else
			puts "Can't write file"
		end
		file_output.puts "Total tax fee: #{tax_calcul.total_tax(arr_product)}$"
		file_output.puts "Total: #{tax_calcul.product_tax(arr_product)}$"
	end
end

# main

file = Txtfile.new("input_product.txt")
arr_product = file.read_input_file

arr_product.each do |product|
	puts product.display_detail
end

tax_calcul = TaxCalculation.new(arr_product)

puts "Total tax fee: #{tax_calcul.total_tax(arr_product)}$"
puts "Total: #{tax_calcul.product_tax(arr_product)}$"
# product detail and total tax fee
out_file = Txtfile.new("output_product.txt")
out_file.write_output_file(arr_product, tax_calcul)