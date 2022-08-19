class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    employees = Employee.all
    render json: employees, serializer: EmployeeSerializer
  end

  def show
    render json: @employee, serializer: EmployeeSerializer
  end

  def create
    @employee = Employee.create!(employee_params)
    # byebug
    @employee.create_employee_user_roles(params[:roles])
    render json: @employee, serializer: EmployeeSerializer
  end

  def update
    if @employee.update(employee_params)
      render json: @employee, serializer: EmployeeSerializer
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
    params.require(:employee).permit(:name, :email, :phone_number, :emp_id, :designation)
  end
end
