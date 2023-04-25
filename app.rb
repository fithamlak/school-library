require './student'
require './teacher'
require './rental'
require './book'
require './books_list'
require './people_list'
require './rentals_list'

class App
  attr_reader :books, :people

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
    rental = Rental.create_rental(@books, @people)
    @rentals_list.add_rental(rental)
  end

  def exit
    puts 'Thanks fo using library app - bye'
    abort
  end
end
