require 'CSV'

class ParseFile
	attr_reader :csv_file
	def initialize(file = {})
		@csv_file = file[:csv_file]
	end


	def display_csv_lines_as_arrays
		CSV.foreach(csv_file) do |row|
			puts row.inspect
		end
	end


	def parse_csv_to_hash
		hash_data_array = []
		CSV.table(csv_file).each do |row|
			hash_data_array << row.to_hash
		end
		return hash_data_array
	end

end#class end

# new_data_structure = 
puts "The first row of the CSV file will be the key to each following row."
puts "Output is an array of hashes."
ParseFile.new(csv_file: 'people.csv').parse_csv_to_hash
# p new_data_structure.first #should be a hash