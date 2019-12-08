class Expense < ApplicationRecord
  belongs_to :country
  belongs_to :user
end
