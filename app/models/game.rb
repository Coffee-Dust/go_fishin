class Game < ApplicationRecord
  has_many :players
  before_save :generate_room_code

  def generate_room_code
    chars = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    code = ""
    6.times do 
      code += chars[rand(chars.size)]
    end
    if self.class.find_by(room_code: code)
      generate_room_code
    else
      self.room_code = code
    end
  end

end
