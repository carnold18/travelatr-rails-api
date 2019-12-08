class CountriesController < ApplicationController

    def daily_average
        # byebug
        id = country_params["id"]
        @country = Country.find(id)
        @total = @country.average_expense(id)
        render json: @total
    end

    private

    def country_params
        params.permit(:name, :abbr_name, :id)
    end

end
