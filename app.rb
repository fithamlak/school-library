require './student'
require './teacher'
require './rental'
require './book'

class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end

  def add_teacher(teacher)
    @people.push(teacher) unless @people.include?(teacher)
  end

  def add_student(student)
    @people.push(student) unless @people.include?(student)
  end

  def add_book(book)
    @books.push(book) unless @books.include?(book)
  end

  def add_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    person.rentals
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

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    add_book(book)
    puts 'Book created successfully!'
  end

  def create_rental
    return puts "Ops, we don't have any book for rent" if @books == []
    return puts "Ops, we don't have registered people who can rent books" if @people == []

    puts 'select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts %[#{index}) Title: "#{book.title}", Author: #{book.author}]
    end
    selected_book = @books[gets.chomp.to_i]
    puts %(You selected "#{selected_book.title}" written by #{selected_book.author})
    puts ''

    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts %[#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}]
    end
    selected_person = @people[gets.chomp.to_i]
    puts "You selected #{selected_person.name}"
    puts ''

    print 'Date: '
    entered_date = gets.chomp

    add_rental(entered_date, selected_book, selected_person)
    puts 'Rental created successfully!'
  end

  def list_rentals
    return puts "Sorry, we don't have any registered people" if @people == []

    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    return puts "Sorry, we don't have any person with this ID" unless person

    if person.rentals.any?
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts %(Date: #{rental.date}, Book: "#{rental.book.title}" by #{rental.book.author})
      end
    else
      puts "Ops, we don't have any rentals registered for #{person.name}"
    end
  end

  def exit
    puts 'Thanks fo using library app - bye'
    abort
  end
end
