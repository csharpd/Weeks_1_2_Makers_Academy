def students
	@students ||= []
end

def welcome
    puts "Welcome to MA"
end

def ask_for(data)
  puts "What's the students #{data}?"
end

def ask_for_name
    puts "What's the students name?"
end

def ask_for_cohort
    puts "What's the students cohort?"
end

def user_input
  gets.chomp
end

def create_student_named(name)
  {name: name}
end


def add(student)
	students << student
end


def student_to_string(student)
	"#{student[:name]}, #{student[:cohort]} cohort"
end

def students_array_to_string
	students.map.with_index(1) do |student, index|
		"#{index}.#{student_to_string(student)}"
	end.join("\n")
end