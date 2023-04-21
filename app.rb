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
end
