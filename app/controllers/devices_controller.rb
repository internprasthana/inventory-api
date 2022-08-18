class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :update, :destroy]

  def index
    @devices = Device.all
     render json: @devices
  end

  def search
    @query = params[:query]
    if @query.present?
      @devices = Device.where("devices.name LIKE ?","%#{@query}%")
      render json: @devices
    end
 end

  def show
    @devices = Device.find(params[:id])
     render json: @devices
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      render json: @device, status: :created, location: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  def update
    if @device.update(device_params)
      render json: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @device.destroy
  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:name,:device_type,:employee_id,:service_tag,:os)
    end

end
