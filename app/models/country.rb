class Country < ApplicationRecord
    has_many :expenses
    has_many :users, through: :expenses

    @@country_id = 0

    def total_expense
        country = Country.find(@@country_id)
        sum = 0
        country.expenses.each do |expense|
            sum += expense["value"]
        end
        sum
    end

    def scrape_total_days
        byebug
    end

    def average_expense(id)
        @@country_id = id
        @country = Country.find(id)
        total = @country.total_expense
        days = @country.scrape_total_days
    end



end
