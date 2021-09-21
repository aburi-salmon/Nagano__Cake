class Publics::AddressesController < ApplicationController
  def index
    @new_address = Address.new
    @addresses = Address.all
  end

  def create
    new_address = Address.new(address_params)
    new_address.member_id = current_member.id
    new_address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end
  
  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :member_id)
  end
  
end
