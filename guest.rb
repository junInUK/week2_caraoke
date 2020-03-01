class Guest

  attr_reader :name, :g_id, :cash, :favourite_songs

  def initialize(name,g_id,cash=0)
    @name = name
    @g_id = g_id
    @cash = cash
    @favourite_songs = []
  end

  def add_favourite_song(song)
    @favourite_songs.push(song)
  end

  def remove_favourite_song(song)
    @favourite_songs.delete(song)
  end

  def favourite_songs_in_room(room)
    flag = false
    for song in @favourite_songs
      if room.songs.index(song) != nil
        flag = true
        puts "Whoo!"
        return flag
      end
    end
    return flag
  end

end
