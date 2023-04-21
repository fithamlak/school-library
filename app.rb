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
end
