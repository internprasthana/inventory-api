class EmployeesController < ApplicationController
  before_action :set_employee, only: [:new,:show, :update, :destroy, :devices]
  def index
    @employees = Employee.all

      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@employees, each_serializer: EmployeesSerializer),
        message: ['Employee list fetched successfully'],
        status: 200,
        type: 'Success'
      }

    # render json: @employees
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
    # render json: @employee

    render json: {
      data: ActiveModelSerializers::SerializableResource.new(@employee, serializer: EmployeesSerializer),
      message: ['Employee profile fetched successfully'],
      status: 200,
      type: 'Success'
    }
  end

  # end


  def create
    @employee = Employee.new(employee_params)

    if @employee.save
       render json: {data: ActiveModelSerializers::SerializableResource.new(@employee,
         each_serializer: EmployeesSerializer),
        status: :created, location: @employee,
        message: ['Employee profile created successfully'],
        status: 200,
        type: 'Success'
      }
      # render json:{
      # data: ActiveModelSerializers::SerializableResource.new(@employees, each_serializer: EmployeesSerializer),
      # message: ['Employee created successfully'],
      # status: 200,
      # type: 'Success' }
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
      params.require(:employee).permit(:name,:email,:phone_number)
    end
end
