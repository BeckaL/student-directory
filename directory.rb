@students = []

def input_students(existing_students)
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  students = existing_students.clone
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

def print_names
  @students.each.with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student" + (@students.count > 1? "s" : "")
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the lists to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_names
  print_footer
end

def process(selection)
  case selection
    when "1"
      if @students.empty?
        @students = input_students([])
      else
        @students = input_students(@students)
      end
    when "2"
      if @students.empty?
        puts "There are currently no students"
      else
        show_students
      end
    when "3" then save_students
    when "9" then exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = student[:name], student[:cohort]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

interactive_menu
