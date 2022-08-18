class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
   @employees = Employee.all
   render json: @employees
  end

  def search
    @query = params[:query]
    if @query.present?
      @employees = Employee.where("employees.name LIKE ?","%#{@query}%")
      render json: @employees
    end
  end

  def new
    @employee = Employee.new
    render json: @employee
  end
  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name,:email,:password,:reset_password,:emp_id,:role,:phone_number,:employee_id)
    end
end
