json.id @booking.id
json.booking_at @booking.booking_at
json.state @booking.state

json.user do
  json.first_name @booking.user.first_name
  json.last_name  @booking.user.last_name
  json.email  @booking.user.email
  json.expire_at  @booking.user.expire_at.to_i
end
