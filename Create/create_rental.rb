require_relative '../rental'

class CreateRental
  def create(rentals, books, people, list_people)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index}) #{book.title}, #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      print "#{index}) "
      list_people.show_person(person)
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rentals.push(Rental.new(date, books[book_index], people[person_index]))
    puts 'Rental created successfully'
  end
end
