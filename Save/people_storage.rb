require_relative './storage'
require './student'
require './teacher'

class PeopleStorage < Storage
  @people = []

  class << self
    attr_accessor :people
  end

  def self.fetch
    people = if File.exist?('./data/people.json')
               JSON.parse(File.read('./data/people.json'))
             else
               []
             end
    deserialize(people)
  end

  def self.save(people)
    people.each do |person|
      PeopleStorage.people.push(serialize(person))
    end

    File.write('./data/people.json', JSON.pretty_generate(PeopleStorage.people))
  end

  def self.serialize(person)
    {
      name: person.name,
      age: person.age,
      id: person.id,
      description: person.class,
      rentals: person.rentals.map { |rental| RentalStorage.serialize(rental) },
      classroom: person.instance_of?(::Student) ? person.classroom : nil,
      specialization: person.instance_of?(::Teacher) ? person.specialization : nil
    }
  end

  def self.deserialize(item)
    people = []
    item.each do |person|
      puts person['class']
      if person['description'] == 'Student'
        people.push(Student.new(person['age'], person['name'], person['id'], person['classroom']))
      else
        people.push(Teacher.new(person['age'], person['name'], person['id'], person['specialization']))
      end
    end
    people
  end
end
