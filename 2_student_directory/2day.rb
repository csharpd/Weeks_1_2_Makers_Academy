require 'date'
require 'active_support/inflector'

@line_width = 100
@students = []

def print_header
	puts "The students of my cohort at Makers Academy".center(@line_width)
	puts "---------------".center(@line_width)
end
	
def print_student
	
	@students.each_with_index do |student, index| 
		puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)  #if student[:name].chars.first.downcase == 'a' && students[:name].length < 12 
	end	
end

def print_footer
	puts "Overall, we have #{@students.length} great #{'student'.pluralize(@students.length)}".center(@line_width)
end

def sort_by_cohort!
	@students.sort_by!{|student| student[:date]}
end

def my_chomps(text)
	text.chars[0..-2].join
end

def input_students
	puts "Please enter the name and cohort of each students".center(@line_width)
	puts "To finish, just hit return twice".center(@line_width)
	begin
		print "Name? => ".center(30)
		name = STDIN.gets.downcase.gsub(/\n/, "")
		unless name.empty?
			begin
				print "Cohort? => ".center(30)
				cohort = STDIN.gets.downcase.gsub(/\n/, "")
				cohort = "june" if cohort.empty?
			end until (Date.parse(cohort) rescue nil)	
			@students << {:name => name, :cohort => cohort.to_sym, :date => Date.parse(cohort)}
			puts "Now we have #{@students.length} #{'student'.pluralize(@students.length)}".center(@line_width)
		end
	end until name.empty?
	
end
 
 def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end


def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def show_students
	print_header
	sort_by_cohort!
	print_student if !@students.empty?
	print_footer if !@students.empty?
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			save_students
		when "4"
			load_students
		when "9"
			exit
		else
			puts "I don't know what that means, try again!"
	end
end

def save_students
	file = File.open("students.csv", "w")
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts(csv_line)
	end
	file.close
end

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym, :date => Date.parse(cohort)}
	end
	file.close
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end

try_load_students
interactive_menu

 