require './list_items'

class ListRentals < List
  def list(rentals)
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
