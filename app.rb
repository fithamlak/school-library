require './student'
require './teacher'
require './rental'
require './book'

class Ap
  attr_reader :books

  def initialize
    @books = []
    @people = []
  end

  def list_books
    if @books == []
      puts 'oops, the store is empty now :-('
    else
      @books.each_with_index do |book, index|
        puts %(#{index + 1} - Title: "#{book.title}", Author: #{book.author})
      end
    end
  end

  def list_people
    if @people == []
      puts 'no lits of people yet here :-('
    else
      @people.each_with_index do |person, index|
        puts %(#{index + 1} - [#{person.class}] Name: #{person.name}, ID: 3{person.id}, Age: #{person.age})
      end
    end
  end

  def create_person
    print 'what do you want to create a student (1) or a teacher (2)? [Input the your choice number]: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'please select a valid option:'
      create_person
    end
  end

  def create_student
    age = gets_age
    name = gets_name
    classroom = gets_classroom
    parent_permission = gets_parent_permission
    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    add_student(student)
    puts 'person creatd successsfully!'
  end

  def create_teacher
    age = gets_age
    name = gets_name
    specialization = gets_specialization
    teacher = Teacher.new(age, specialization, name)
    add_teacher(teacher)
    puts 'person created successfully!'
  end

  def gets_age
    print 'Age: '
    gets.chomp
  end

  def gets_classroom
    print 'Classroom: '
    gets.chomp
  end

  def gets_name
    print 'Name: '
    gets.chomp
  end

  def gets_parent_permission
    print 'Does he or she has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'please enter a valid option'
      gets_parent_persmission
    end
  end

  def gets_specialization
    print 'specialization'
    gets.chomp
  end  
end
