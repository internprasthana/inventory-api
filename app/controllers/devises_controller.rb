class DevisesController < ApplicationController
  before_action :set_devise, only: [:show, :update, :destroy]
def index
  @devises = Devise.all

  render json: @devises
end

def show
  render json: @devise
end

def create
  @devise = Devise.new(devise_params)

  if @devise.save
    render json: @devise, status: :created, location: @devise
  else
    render json: @devise.errors, status: :unprocessable_entity
  end
end

def update
  if @devise.update(devise_params)
    render json: @devise
  else
    render json: @devise.errors, status: :unprocessable_entity
  end
end

def destroy
  @devise.destroy
end

private
  def set_devise
    @devise = Devise.find(params[:id])
  end

  def devise_params
    params.require(:devise).permit(:name,:devise_type,:employee_id, :assigned_to, :service_tag, :os)
  end
end
