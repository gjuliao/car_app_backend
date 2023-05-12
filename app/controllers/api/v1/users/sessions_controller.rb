class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render_response(:signed_in, payload: resource)
    # render json: { message: 'Signed in succesfully.', user: resource }, status: :ok
  end

  def respond_to_on_destroy
    render_response(:signed_out)
    # render json: { message: 'Signed out succesfully.' }, status: :ok
  end
end
