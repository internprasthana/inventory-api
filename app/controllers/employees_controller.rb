class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy, :devices]
def index
  @employees = Employee.all

  render json: @employees
end
def devices
  @devices = @employee.devices
    render json: @devices
end
def new
  @employee = Employee.new
  render json: @employee
end
def show
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
    params.require(:employee).permit(:name,:email,:phonenumber, :emp_id, :devices, :role)
  end
end
