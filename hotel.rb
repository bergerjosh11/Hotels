require "csv"

class HotelsTable
  def initialize(csv_file)
    @hotels = CSV.table(csv_file).map { |row| Hotel.new(row) }
  end

  def name_of_hotel(hotel_name)
    @hotels.find { |hotel| hotel.name == hotel_name } || NullHotel.new
  end
end

class NullHotel
  def null_messege
    "Hotel does not exist in database"
  end
end

class Hotel
  attr_reader :name

  def initialize(options)
    @name = options[:hotel].strip
    @phone_number = PhoneNumber.new(options[:phone_number])
    @location = options[:city].strip
    @number_of_rooms = count_rooms(options)
  end

  def hotel_statistics
    "Telephone number: #{phone_number}\n" +
      "City of : #{location}\n" +
      "Quantity of rooms: #{number_of_rooms}"
  end

   def query
    print "Which hotel are you looking for?"
    gets.chomp
  end
end

#HotelDatabase.new("hotels.csv")