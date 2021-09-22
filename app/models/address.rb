class Address < ApplicationRecord
    belongs_to :member

    def full_address
      "〒" + self.postal_code + " " + self.address + "　" + self.name
    end
end
