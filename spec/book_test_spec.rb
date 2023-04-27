require 'rspec'
require './book'

describe Book do
  before(:each) do
    Book.class_variable_set(:@@all, [])
  end
  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      book = Book.new('think and grow rich', 'Napolion hill')
      expect(book.title).to eq('think and grow rich')
      expect(book.author).to eq('Napolion hill')
    end
  end

  describe '.all' do
    it 'returns an array of all books' do
      book1 = Book.new('think and grow rich', 'Napolion hill')
      book2 = Book.new('rich dad poor dad', 'Robert Kiosaki')
      expect(Book.all).to eq([book1, book2])
    end
  end

  describe '.find_by_id' do
    it 'returns the book with the given id' do
      book1 = Book.new('think and grow rich', 'Napolion hill')
      expect(Book.find_by_id(book1.id)).to eq(book1)
    end
  end
end
