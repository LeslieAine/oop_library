require './person'
require './student'
require './teacher'
require './Create/create'
require './Create/create_book'
require './rental'
require './welcome'
require './list_books'
require './list_people'
require './list_rentals'
require './Create/create_person'
require './Create/create_rental'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
    @welcome = Welcome.new
    @list_books = ListBooks.new
    @list_people = ListPeople.new
    @list_rentals = ListRentals.new
    @create_books = CreateBook.new
    @create_person = CreatePerson.new
    @create_rental = CreateRental.new
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    @welcome.welcome

    loop do
      @welcome.menu
      option = gets.chomp

      case option
      when '1'
        @list_books.list(@books)
      when '2'
        @list_people.list(@people)
      when '3'
        @create_person.input_person_info(@people)
      when '4'
        @create_books.create(@books)
      when '5'
        @create_rental.create(@rentals, @books, @people, @list_people)
      when '6'
        @list_rentals.list(@rentals)
      when '7', 'q', 'quit'
        break
      end
    end
    puts 'Thank you for using this app!'
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
