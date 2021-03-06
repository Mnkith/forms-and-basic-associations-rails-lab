class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name 
    self.artist&.name
  end

  def note_desc=(descriptions)
    descriptions.each do |d|
      unless d == ""
        n = Note.create content: d
        self.notes << n
      end
    end
  end

  def note_desc
    self.notes.map{|n| n.content}
  end
end

