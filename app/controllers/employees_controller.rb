class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy, :devises]
  #after_action :user_signup, only: [:create]

def index
  @employees = Employee.all
  render json: @employees, serializer: EmployeeSerializer
end

def devices
  @devises = @employee.devises
    render json: @devises, serializer: DeviseSerializer
end

def new
  @employee = Employee.new

  render json: @employee, serializer: EmployeeSerializer
end
def show
  render json: @employee, serializer: EmployeeSerializer
end

def create
  @employee = Employee.new(employee_params)
  if @employee.save
    @user = User.new(:employee_id =>@employee_id, :email => @employee.email, :password => @employee.emp_id)
     if@user.save
       @role = UserRole.new(:user_id => @user_id, :role => @employee.role)
       @role.save
     end
   render json: @employee, serializer: EmployeeSerializer

  else
    render json: @employee.errors, status: :unprocessable_entity
  end
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
    params.require(:employee).permit(:name,:email,:phonenumber, :emp_id, :devices, :role)
  end


  



end
