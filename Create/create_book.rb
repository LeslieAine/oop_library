require_relative 'create'
require './book'

class CreateBook < Create
  def create(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    books.push(Book.new(title, author))
    puts 'Book created successfully'
  end
end
