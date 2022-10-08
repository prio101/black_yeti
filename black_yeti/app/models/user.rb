# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false
  
  DEFINED_TIME = 7.days.after
end
