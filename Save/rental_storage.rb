require 'json'
require_relative './storage'
require './rental'
require './Save/book_storage'
require './Save/people_storage'

class RentalStorage < Storage
  @rentals = []

  class << self
    attr_accessor :rentals
  end

  def self.fetch
    rentals = if File.exist?('./data/rentals.json')
                JSON.parse(File.read('./data/rentals.json'))
              else
                []
              end
    deserialize(rentals)
  end

  def self.save(rentals)
    rentals.each do |rental|
      RentalStorage.rentals.push(serialize(rental))
    end

    File.write('./data/rentals.json', JSON.pretty_generate(RentalStorage.rentals))
  end

  def self.serialize(rental)
    {
      date: rental.date,
      book: rental.book.title,
      person: rental.person.id
    }
  end

  def self.deserialize(item)
    temp = []
    item.each do |rental|
      person_id = rental['person']
      person = PeopleStorage.fetch.find { |person_temp| person_temp.id == person_id }
      book_name = rental['book']
      book = BookStorage.fetch.find { |book_temp| book_temp.title == book_name }
      rental = Rental.new(rental['date'], book, person)
      temp.push(rental)
    end
    temp
  end
end
