require './student'
require './teacher'
require './rental'
require './book'
require './people_list'
require './books_list'
require './rentals_list'
require './reader_writer'
require 'json'

class App
  attr_reader :books, :people

  include ReaderWriter

  def initialize
    @books_list = BooksList.new
    @books = @books_list.books
    @people_list = PeopleList.new
    @people = @people_list.people
    @rentals_list = RentalsList.new
    @rentals = @rentals_list.rentals
  end

  def list_books
    @books_list.list_books
  end

  def create_book
    book = Book.create_book
    @books_list.add_book(book)
  end

  def list_people
    @people_list.list_people
  end

  def create_person
    person = Person.create_person
    @people_list.add_person(person)
    puts 'person creatd successsfully!'
  end

  def list_rentals
    @rentals_list.list_rentals(@people)
  end

  def rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    person.rentals
  end

  def create_rental
    rental = Rental.create_rental
    @rentals_list.add_rental(rental)
  end

  def exit
    ReaderWriter.save(@books, 'books.json') if @books.any?
    ReaderWriter.save(@people, 'people.json') if @people.any?
    ReaderWriter.save(@rentals, 'rentals.json') if @rentals.any?
    puts 'Thanks fo using library app - bye'
    abort
  end
end
