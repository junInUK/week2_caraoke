require ('pry-byebug')

class Room

  attr_reader :name, :r_id, :songs, :guests, :free_seats, :check_in_fee

  def initialize(name,r_id,check_in_fee=0,free_seats=0)
    @name = name
    @r_id = r_id
    @songs = []
    @guests = []
    @free_seats = free_seats
    @check_in_fee = check_in_fee
    @fee_spend = 0
  end

  def add_guest(guest)
    # binding.pry
    # The guest can only be added into the room once
    return if nil != @guests.index(guest)
    # Guest cannot be checked in if there has no free seats(space)
    return if 0 == @free_seats
    return if guest.cash < @check_in_fee
    @guests.push(guest)
    @free_seats -= 1
    @fee_spend += @check_in_fee
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

  def check_out_pay()
    return @fee_spend 
  end

end
