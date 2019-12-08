class User < ApplicationRecord
    has_many :expenses
    has_many :countries, through: :expenses
end
