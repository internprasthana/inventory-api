class EmployeesController < ApplicationController

  def search
    @query = params[:query]
    if @query.present?
      @employees = Employee.where("employees.name LIKE ?","%#{@query}%")
      render json: @employees
    end
  end
  
end
