class Game < ApplicationRecord
  belongs_to :user

  protected
    def self.title
      "Dragon Masters"
    end
end
