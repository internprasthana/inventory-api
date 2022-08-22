class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :update, :destroy]
    def index
      @devices = Device.all
      render json: @devices, serializer: DeviceSerializer, status: :ok
    end
    def new
      @device = Device.new
      render json: @device
    end
    def show
      render json: @device, serializer: DeviceSerializer, status: :ok
    end

   def search
        @query = params[:query]
    if @query.present?
       @devices = Device.where("name LIKE ? OR service_tag LIKE ?", "%#{@query}%", "%#{@query}%")
       render json: @devices
    end

   end
    def create
      @device = Device.new(device_params)
      if @device.save
        render json: @device, serializer: DeviceSerializer, status: :created
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end
    def update
      if @device.update(device_params)
        render json: @device, serializer: DeviceSerializer, status: :ok
      else
        render json: @device.errors, status: :unprocessable_entity
      end

    def destroy
      @device.destroy
      render head :no_content
    end
    private
      def set_device
        @device = Device.find(params[:id])
      end
      def device_params
        params.require(:device).permit(:name,:device_type,:os,:service_tag)
      end

end
