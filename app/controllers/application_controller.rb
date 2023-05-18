class ApplicationController < ActionController::API
  protected

  def render_response(code, payload = {})
    caller = self.class.name.split('::').last
    switcher = "#{caller.chomp('Controller').upcase}_RESPONSES"
    responses = Object.const_get(switcher)

    render json: {
      errors: responses[code][:errors],
      message_code: code,
      message: responses[code][:message],
      **payload
    }, status: responses[code][:status]
  end

  def authenticate_user!(opts = {})
    if user_signed_in?
      super(opts)
    else
      render_response(:unauthenticated)
    end
  end
end
