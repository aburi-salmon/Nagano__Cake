# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # def create
  #   @user = login(params[:email], params[:password])
  #   if @user
  #     redirect_back_or_to root_path, success: t('ようこそ')
  #   else
  #     flash[:danger] = 'ログインに失敗しました'
  #     render :new
  #   end
  # end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

    protected

  def after_sign_in_path_for(resource)
    admins_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
