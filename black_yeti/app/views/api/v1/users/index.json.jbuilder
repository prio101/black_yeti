json.(@user, :email, :first_name, :last_name)
json.token_expire_at(@user.expire_at.to_i)
