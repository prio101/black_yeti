class Api::V1::AuthsController < Api::ApiController
  def login
    if params[:email].present? and params[:password].present?
      user = User.find_by(email: params[:email])
      render json: { data: 'No User Found' } if user.nil?
      return if user.nil?
      load_response(user)
    end
  end

  def register
    if params[:email].present? and params[:password].present? and params[:password_confirmation].present?
      render json: { data: "password doesn't match, try again" } if password_wont_match(params[:password], params[:password_confirmation])
      return if password_wont_match(params[:password], params[:password_confirmation])
      user = User.new
      user.email = params[:email]
      user.password_digest = params[:password]
      load_response(user)
    end
  end

  def authenticate
    # not implemented yet
  end


  private

  def load_response(user)
    expire_at = User::DEFINED_TIME
    token = generate_token({ data: { email: user.email, expire_at: expire_at }})
    user.update(token: token, expire_at: expire_at)
    render json: { data: { token: token, expire_at: expire_at.to_time.to_i } } , status: :ok
  end

  def password_wont_match(password, password_confirmation)
    password != password_confirmation
  end

  def generate_token payload
    hmac_secret = 'my$ecretK3y'
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  # not implemented yet.
  def decode_token token
    hmac_secret = 'my$ecretK3y'
    JWT.decode(token, hmac_secret,  true, { algorithm: 'HS256' })
  end
end
