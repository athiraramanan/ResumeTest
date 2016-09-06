require "csv"
class Resume_builder
	def initialize()
	@name = ""
	@gender = ""
	@age = ""
	@qualification = ""
	@skills = ""
	@phnumber = ""
	@mail = ""
	@file_name = ""
	end

	def query
	puts "Enter Your Name."
	  @name = gets.chomp.to_s
	puts "Gender?m/f"
	  @gender = gets.chomp.to_s
	puts "Your Age."
	  @age = gets.chomp.to_i
	puts "What's Your Qualification?"
	  @qualification = gets.chomp.to_s
	puts "Skills You Own."
	  @skills = gets.chomp.to_s
	puts "Please Give Your Contact Number."
	  @phnumber = gets.chomp.to_i
	puts "Enter Your Email_ID."
	  @mail = gets.chomp.to_s
	create_file()
	end
	
	def create_file
	puts "which format do you need?txt/csv"
	format = gets.chomp
		if(format == "txt")
			store_in_txt()
		elsif(format == "csv")
		 	store_in_csv()
		else
			puts "invalid format."
		end
	end
	
	

	def store_in_txt
	
	resume = " NAME\t\t: #{@name}\n GENDER\t\t: #{@gender}\n AGE\t\t: #{@age}\n QUALIFICATION\t: #{@qualification}\n SKILLS\t\t: #{@skills}\n CONTACT NUMBER\t: #{@phnumber}\n EMAIL-ID\t: #{@mail}\n"
		@file_name = File.new("output2.txt",'w+')
		@file_name.close
		File.open(@file_name,'w')do|file|file.write(resume)
		puts "The output file path is:"
		puts File.absolute_path(@file_name)
		file.close
		end
	end
	
	def initial_csv
	CSV.open("output2.csv", "wb") do |csv|
  	   csv << ["Name","#{@name}"]
  	   csv << ["GENDER","#{@gender}"]
  	   csv << ["AGE","#{@age}"]
  	   csv << ["QUALIFICATION","#{@qualification}"]
  	   csv << ["SKILLS","#{@skills}"]
	   csv << ["CONTACT NUMBER","#{@phnumber}"]
  	   csv << ["E-MAIL","#{@mail}"]
	  end
	return
	end
	
	def store_in_csv
	 initial_csv()
	end
	
	
end
resume = Resume_builder.new()
resume.query()

