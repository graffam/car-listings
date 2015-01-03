class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.create(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturers_path(@manufacturer)
    else
      render "new"
    end
  end

  def show
    @manufacturer = Manufacturer.find(params["id"])
  end

  def index
    @manufacturers = Manufacturer.all
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
