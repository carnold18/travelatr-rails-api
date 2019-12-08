# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
# require 'pry'

User.destroy_all
Country.destroy_all
Expense.destroy_all


# require "expense_data.json"

# import the parsed data from the json file

expenses = JSON.parse(File.read(Rails.root.join('db', 'expense_data.json')))

# create one user for the association

user = User.create(username: "backpacker1", email: "backpacker1@example.com", password: "password", date_of_birth: "10/01/1992")


# create all countries with associated expenses

hungary = Country.create(name: "hungary", abbr_name: "hu")
romania = Country.create(name: "romania", abbr_name: "ro")
slovenia = Country.create(name: "slovenia", abbr_name: "sl")
croatia = Country.create(name: "croatia", abbr_name: "hr")
austria = Country.create(name: "austria", abbr_name: "au")
poland = Country.create(name: "poland", abbr_name: "pl")
germany = Country.create(name: "germany", abbr_name: "de")
portugal = Country.create(name: "portugal", abbr_name: "pt")
spain = Country.create(name: "spain", abbr_name: "es")
chezchia = Country.create(name: "chezchia", abbr_name: "cz")
slovakia = Country.create(name: "slovakia", abbr_name: "sv")
vietnam = Country.create(name: "vietnam", abbr_name: "vi")
japan = Country.create(name: "japan", abbr_name: "ja")
thailand = Country.create(name: "thailand", abbr_name: "th")
cambodia = Country.create(name: "cambodia", abbr_name: "ca")
india = Country.create(name: "india", abbr_name: "in")
nepal = Country.create(name: "nepal", abbr_name: "ne")
peru = Country.create(name: "peru", abbr_name: "pe")
chile = Country.create(name: "chile", abbr_name: "ch")
argentina = Country.create(name: "argentina", abbr_name: "ar")
bolivia = Country.create(name: "bolivia", abbr_name: "bo")


# create expenses that belong to a user and a country
# based on country name
Country.all.each do |country|
    # puts country.abbr_name
    # puts user.username
    # puts expenses["expenses"][0]["Location"].downcase
    expenses["expenses"].each do |expense|
        # puts expense
        if expense["Location"].to_s.size > 0
            if expense["Location"].downcase == country.abbr_name
                Expense.create(name: expense["name"], value: expense["value"], user: user, country: country)
            end
        end
    end
end