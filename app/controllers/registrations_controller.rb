class RegistrationsController < Devise::RegistrationsController
  before_action :set_cities, only: [:new, :create, :update, :edit]

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :age, :city_id)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :age, :city_id)
  end

  def set_cities
    @cities = City.select(:id, :name)
  end
end
