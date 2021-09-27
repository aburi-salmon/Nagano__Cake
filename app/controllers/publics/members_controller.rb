class Publics::MembersController < ApplicationController
  
  def show
    @member = current_member
  end
  
  def edit
    @member = current_member
  end      
  
  def update
    member = current_member
    member.update(member_params)
    redirect_to member_path(current_member)
    
  end      
  
  def confirm
  end
  
  def withdraw
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
private

  def member_params
   params.require(:member).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :phone_number, :postal_code, :email, :address, :is_deleted)
  end
end
