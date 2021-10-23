class Game < ApplicationRecord
  has_many :players
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.room_code = generate_room_code
  end

  def generate_room_code
    chars = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    code = ""
    6.times do 
      code += chars[rand(chars.size)]
    end
    if self.class.find_by(room_code: code)
      generate_room_code
    else
      return code
    end
  end

end
