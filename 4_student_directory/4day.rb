def print_header
  puts center ("The students of my cohort at Makers Academy")
  puts center ( "-------------" )
end

def print_list(students)
  students.map {|student, index|student[:cohort]}.uniq.sort.each do |cohort|
    puts "The students in the #{cohort} cohort"
    index = 0 
    students.each do |student|
      if student[:cohort] == cohort 
      puts "#{index + 1}. name: #{student[:name]}" 
      index += 1 
    end  
    end
  end

  # #students.each_with_index do |student, index|
  # i = 0
  # until students.length == i do
  #   puts center(" #{students[i][:name]} (#{students[i][:cohort]} cohort, #{students[i][:hobby]})") #if (student[i][:name].downcase.start_with?("a") && student[i][:name].length < 3)
  # i += 1
  # end
end

##{index + 1}.
def print_footer(names)    
  puts center ( "Overall, we have #{names.length} great students" )
end

def input_students
  puts center ("Please enter the names of the students" )
  puts center ("To finish, just hit return twice" )
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
 #while the name is not empty, repeat this code
  while !name.empty? do   
    puts center("Please enter the cohort of the student")
    cohort = gets.chomp.downcase
    months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
      if !months.include? cohort
        puts "You spelt the month wrong - try again"
        cohort = gets.chomp.downcase
      end
    students << {:name => name, :cohort => cohort, :hobby => :coding}    
    puts center("Now we have #{students.length} students")
    name = gets.chomp
  end
  students
end

def center(string)
  string.center(100)
end


students = input_students
print_header
print_list(students)
print_footer(students)

 # if cohort.empty? 
      #      cohort = "June" 
      #  end