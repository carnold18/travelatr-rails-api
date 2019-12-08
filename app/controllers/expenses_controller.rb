class ExpensesController < ApplicationController

    def index
        @expenses = Expense.all
        render json: @expenses
    end

    def new
        @expense = Expense.new
    end

    def create
        @expense = Expense.new(expense_params)
        if @expense.save!
            render json: @expense
        else
            render json: {error: "Could not create expense"}
        end
    end

    def edit
        @expense = Expense.find(id)
    end

    def update
        @expense = Expense.find(id)
        @expense.update(expense_params)
    end

    def destroy
        @expense = Expense.find(id)
        @expense.destroy
    end

    private

    def expense_params
        params.require(:expense).permit(:name, :value, :user_id, :country_id)
    end

end
