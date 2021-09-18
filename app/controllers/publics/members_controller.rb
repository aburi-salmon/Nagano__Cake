class Publics::MembersController < ApplicationController
  
  def show
    @member = current_member
  end
  
  def edit
    @member = current_member
  end      
  
  def update
    
  end      
  
  def confirm
  end
  
  def withdrow
  end
  
private

  def member_params
   params.require(:member).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :phone_number, :postal_code, :address)
  end
end
