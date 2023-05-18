class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(sign_up_params)

    if user.save
      render_response(:signed_up, payload: user)
      # render json: { user:, message: 'Signed up successfully', is_success: true }, status: :ok
    else
      render_response(:unable_to_sign_up)
      # render json: { message: 'Sign up failed', is_success: false }, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in?
      current_user.destroy
      render_response(:account_deleted)
    else
      render_response(:unauthenticated)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
