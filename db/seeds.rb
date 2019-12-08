# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'json'
# require 'pry'


# import the parsed data from the json file

expenses = JSON.parse(File.read('./expense_data.json'))

# create one user for the association

user = User.create(username: "backpacker1", email: "backpacker1@example.com", password: "password", age: "10/01/1992")


# create all countries with associated expenses

hungary = Country.create(name: "hungary", abbr_name: "hu", stats: {}, coordinates: {})
romania = Country.create(name: "romania", abbr_name: "ro", stats: {}, coordinates: {})
slovenia = Country.create(name: "slovenia", abbr_name: "sl", stats: {}, coordinates: {})
croatia = Country.create(name: "croatia", abbr_name: "hr", stats: {}, coordinates: {})
austria = Country.create(name: "austria", abbr_name: "au", stats: {}, coordinates: {})
poland = Country.create(name: "poland", abbr_name: "pl", stats: {}, coordinates: {})
germany = Country.create(name: "germany", abbr_name: "de", stats: {}, coordinates: {})
portugal = Country.create(name: "portugal", abbr_name: "pt", stats: {}, coordinates: {})
spain = Country.create(name: "spain", abbr_name: "es", stats: {}, coordinates: {})
chezchia = Country.create(name: "chezchia", abbr_name: "cz", stats: {}, coordinates: {})
slovakia = Country.create(name: "slovakia", abbr_name: "sv", stats: {}, coordinates: {})
vietnam = Country.create(name: "vietnam", abbr_name: "vi", stats: {}, coordinates: {})
japan = Country.create(name: "japan", abbr_name: "ja", stats: {}, coordinates: {})
thailand = Country.create(name: "thailand", abbr_name: "th", stats: {}, coordinates: {})
cambodia = Country.create(name: "cambodia", abbr_name: "ca", stats: {}, coordinates: {})
india = Country.create(name: "india", abbr_name: "in", stats: {}, coordinates: {})
nepal = Country.create(name: "nepal", abbr_name: "ne", stats: {}, coordinates: {})
peru = Country.create(name: "peru", abbr_name: "pe", stats: {}, coordinates: {})
chile = Country.create(name: "chile", abbr_name: "ch", stats: {}, coordinates: {})
argentina = Country.create(name: "argentina", abbr_name: "ar", stats: {}, coordinates: {})
bolivia = Country.create(name: "bolivia", abbr_name: "bo", stats: {}, coordinates: {})


# create expenses that belong to a user and a country
# based on country name
Country.all.each do |country|
    expenses["expenses"].each do |expense|
        if expense["Location"] == country["abbr_name"]
            Expense.create(type: expense["name"], value: expense["value"], user: user, country: country)
        end
    end
end