require 'date'

def print_header
  puts "The students of my cohort at Makers Academy\n".center(100)
  puts "-------------\n".center(100)
end
def print_names(students)
  # students.each.with_index(1) do |student, index|
  i = 0
  while i < students.length do 
    puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)".center(100)
    i += 1 #if (student[:name].downcase.start_with?("a") && student[:name].length < 4)
  end
end

def print_footer(names)    
  print center("Overall, we have #{names.length} great students \n")
end

def ask_for(value)
  puts center("#{value}? =>")
  gets.chomp
end

def sort_by_cohort!(students)
  students.sort_by!{|student| student[:date]}
end

def pluralize(value)
  return "student" if value == 1
    "students"
 end


def input_students
  puts "Please enter the names of the students".center(100)
  print "To finish, just hit return twice\n".center(100)
  # create an empty array
  students = []
  # get the first name
  name = ask_for('name')
  cohort = ask_for('cohort')
            while !(Date.parse(cohort) rescue nil)  
            puts "You spelt the cohort wrong"
            cohort = ask_for('cohort')
            end
      while !name.empty? do 
        students << {:name => name, :cohort => cohort, :date => Date.parse(cohort)}    
        print "Now we have #{students.length} #{pluralize(students.length)}\n".center(100)
         name = ask_for('name')
         cohort = ask_for('cohort')
            while !(Date.parse(cohort) rescue nil)  
            puts "You spelt the cohort wrong"
            cohort = ask_for('cohort')
            end
       end
  students
end
  
  
  

# while the name is not empty, repeat this code
  
    # add the student hash to the array
       
    
    # get another name from the user
    


  # return the array of students
 

def center(string)
   string.center(100)
 end
# if cohort.empty?
#    cohort = "June"
#   end


students = input_students
print_header
sort_by_cohort!(students)
print_names(students) 
print_footer(students)

# def input_students
#   puts "Please enter the names of the students".center(100)
#   print "To finish, just hit return twice\n".center(100)
#   # create an empty array
#   students = []
#   # get the first name
#   name = ask_for('name')
#    cohort = ask_for('cohort')
#   while !(Date.parse(cohort) rescue nil)  
#     puts "You spelt the cohort wrong"
#     cohort = ask_for('cohort')
#   end
#   students << {:name => name, :cohort => cohort, :date => Date.parse(cohort)} 

# # while the name is not empty, repeat this code
#   while !name.empty? do    
#     # add the student hash to the array
       
#     print "Now we have #{students.length} students\n".center(100)
#     # get another name from the user
#     name = ask_for('name')
#     cohort = ask_for('cohort')
#     students << {:name => name, :cohort => cohort, :date => Date.parse(cohort)}

#     while !(Date.parse(cohort) rescue nil)  
    
#     puts "You spelt the cohort wrong"
#     cohort = ask_for('cohort')
#     end
#   end