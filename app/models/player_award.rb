class PlayerAward < ApplicationRecord

  belongs_to :player
  belongs_to :award

end
