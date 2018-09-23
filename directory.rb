def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} student" + (students.count > 1? "s" : "")
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(60)
  puts "------------".center(60)
end

def print_names(students)
  students.each.with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def run_directory
  students = input_students
  if students.empty?
    puts "There are no students currently enrolled"
  else
    print_header
    print_names(students)
    print_footer(students)
  end
end

run_directory
