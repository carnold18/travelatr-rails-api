class Country < ApplicationRecord
    has_many :expenses
    has_many :users, through: :expenses

    @@country_id = 0

    def total_expense(country)
        sum = 0
        country.expenses.each do |expense|
            sum += expense["value"]
        end
        puts sum
        sum
    end

    def scrape_total_days(country)
        days = country.expenses.where(category: "L").reduce(0) { |sum, expense| sum + expense[:name][-2].to_i }
        puts days
        days
    end

    def average_expense(id)
        @@country_id = id
        country = Country.find(id)
        total_cost = total_expense(country).to_f
        total_days = scrape_total_days(country).to_f
        avg = total_cost/total_days
        avg
    end



end
