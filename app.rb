require './student'
require './teacher'
require './rental'
require './book'

class Ap
  attr_reader :books

  def initialize
    @books = []
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
end
