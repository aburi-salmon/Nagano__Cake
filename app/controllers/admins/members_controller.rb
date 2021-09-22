class Admins::MembersController < ApplicationController
  def index
    @members = Member.all
    
  end
    
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admins_member_path(@member)
    
  end
  
  private

  def member_params
   params.require(:member).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :phone_number, :postal_code, :email, :address, :is_deleted)
  end
end

