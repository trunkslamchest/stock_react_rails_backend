
class User < ApplicationRecord
  include ActiveModel::Validations
  has_one_attached :avatar

  has_secure_password

  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

  validates :user_name,
    presence: {
      message: ->(object, data) do
        if object.user_name = ""
          object.errors.add :user_name, 'User Name cannot be blank'
        end
      end
    },
    uniqueness: {
      message: ->(object, data) do
        "#{data[:value]} already exists"
      end
    }

  validates :password,
    presence: {
      message: ->(object, data) do
        if object.user_name = ""
          object.errors.add :password, 'Password cannot be blank'
        end
      end
    },
    format: {with: PASSWORD_FORMAT}

  validates :email,
    presence: {
      message: ->(object, data) do
        if object.user_name = ""
          object.errors.add :email, 'Email cannot be blank'
        end
      end
    },
    uniqueness: {
      message: ->(object, data) do
        "#{data[:value]} already exists"
      end
    }

  validates :access, :first_name, :last_name, :gender, :birth_day, :birth_month, :birth_year, :house_number, :street_name, :city_town, :state, :zip_code, presence: true

  # validates :user_name, :email, :access, :first_name, :last_name, :gender, :birth_day, :birth_month, :birth_year, :house_number, :street_name, :city_town, :state, :zip_code, presence: true
  # validates :user_name, :email, uniqueness: true

  # validates :password, format: {with: PASSWORD_FORMAT}

end
