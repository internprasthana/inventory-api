class DevicesController < ApplicationController

  def search
    @query = params[:query]
    if @query.present?
       @devices = Device.where("devices.name LIKE ?","%#{@query}%")
      render json: @devices
    end
  end

end
