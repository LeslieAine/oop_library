require './student'
require './teacher'
class ListPeople < List
  def show_person(person)
    print "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    puts ", Specialization: #{person.specialization}" if person.instance_of?(Teacher)
    puts ", Classroom: #{person.classroom}" if person.instance_of?(Student)
  end

  def list(people)
    if people.empty?
      puts 'No people found'
    else
      people.each { |person| show_person(person) }
    end
  end
end
