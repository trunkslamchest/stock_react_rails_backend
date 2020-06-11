
class User < ApplicationRecord
  # include ActiveModel::Validations
  has_one_attached :avatar

  has_secure_password

  validate :valid_user_name
  validate :valid_email
  validate :valid_first_name
  validate :valid_last_name
  validate :valid_gender
  validate :valid_birth_day
  validate :valid_birth_month
  validate :valid_birth_year
  validate :valid_house_number
  validate :valid_street_name
  validate :valid_city_town
  validate :valid_state
  validate :valid_zip_code

  def valid_user_name
    if user_name == ""
      errors.add(:user_name, 'User Name cannot be blank')
    end

    if !(user_name == "") && user_name.length <= 5
      errors.add(:user_name, 'User Name cannot be longer than 5 characters')
    elsif !(user_name == "") && user_name.length > 30
      errors.add(:user_name, 'User Name cannot be shorter than 30 characters')
    end

    find_user = User.find_by_user_name(user_name)

    unless find_user.nil?
      errors.add(:user_name, "#{user_name} already exists")
    end
  end

  def valid_email
    if email == ""
      errors.add(:email, 'Email cannot be blank')
    end

    find_email = User.find_by_email(email)

    unless find_email.nil?
      errors.add(:email, "#{email} already exists")
    end
  end

  def valid_first_name
    if first_name == ""
      errors.add(:first_name, 'First Name cannot be blank')
    end

    if !(first_name == "") && first_name.length < 2
      errors.add(:first_name, 'First Name cannot be shorter than 1 letter')
    elsif !(first_name == "") && first_name.length > 30
      errors.add(:first_name, 'First Name cannot be longer than 30 letters')
    end
  end


  def valid_last_name
    if last_name == ""
      errors.add(:last_name, 'Last Name cannot be blank')
    end

    if !(last_name == "") && last_name.length < 2
      errors.add(:last_name, 'Last Name cannot be shorter than 1 letter')
    elsif !(last_name == "") && last_name.length > 30
      errors.add(:last_name, 'Last Name cannot be longer than 30 letters')
    end
  end

  def valid_gender
    if gender == ""
      errors.add(:gender, 'Gender cannot be blank')
    end
  end

  def valid_birth_day
    if birth_day.nil?
      errors.add(:birth_day, 'Birth Day cannot be blank')
    end

    if !(birth_day.nil?) && birth_day.to_i < 1
      errors.add(:birth_day, 'Birth Day must be greater than 1')
    elsif !(birth_day.nil?) && birth_day.to_i > 31
      errors.add(:birth_day, 'Birth Day must be less than 31')
    end
  end

  def valid_birth_month
    if birth_month == ""
      errors.add(:birth_month, 'Birth Month cannot be blank')
    end
  end

  def valid_birth_year
    if birth_year.nil?
      errors.add(:birth_year, 'Birth Year cannot be blank')
    end

    if !(birth_year.nil?) && birth_year.to_i < 1900
      errors.add(:birth_year, 'Birth Year must be greater than 1900')
    elsif !(birth_year.nil?) && birth_year.to_i > 2002
      errors.add(:birth_year, 'Birth Year must be less than 2002')
    end
  end

  def valid_house_number
    if house_number.nil?
      errors.add(:house_number, 'Apt./House Number cannot be blank')
    end

    if !(house_number.nil?) && house_number.to_i < 1
      errors.add(:house_number, 'Apt./House Number cannot be less than 1')
    elsif !(house_number.nil?) && house_number.to_i > 9999
      errors.add(:house_number, 'Apt./House Number cannot be greater than 9999')
    end
  end

  def valid_street_name
    if street_name == ""
      errors.add(:street_name, 'Street Name cannot be blank')
    end

    if !(street_name == "") && street_name.length < 3
      errors.add(:street_name, 'Street Name cannot be shorter than 3 characters')
    elsif !(street_name == "") && street_name.length > 100
      errors.add(:street_name, 'Street Name cannot be longer than 100 characters')
    end
  end

  def valid_city_town
    if city_town == ""
      errors.add(:city_town, 'City/Town cannot be blank')
    end

    if !(city_town == "") && city_town.length < 3
      errors.add(:city_town, 'City/Town cannot be shorter than 3 characters')
    elsif !(city_town == "") && city_town.length > 100
      errors.add(:city_town, 'City/Town cannot be longer than 100 characters')
    end
  end

  def valid_state
    if state == ""
      errors.add(:state, 'State cannot be blank')
    end
  end

  def valid_zip_code
    if zip_code.nil?
      errors.add(:zip_code, 'Zip Code cannot be blank')
    end

    if !(zip_code.nil?) && zip_code.to_i < 10000
      errors.add(:zip_code, 'Zip Code cannot be less than 10000')
    elsif !(zip_code.nil?) && zip_code.to_i > 99999
      errors.add(:zip_code, 'Zip Code cannot be greater than 99999')
    end
  end

#   PASSWORD_FORMAT = /\A
#   (?=.{8,})          # Must contain 8 or more characters
#   (?=.*\d)           # Must contain a digit
#   (?=.*[a-z])        # Must contain a lower case character
#   (?=.*[A-Z])        # Must contain an upper case character
#   (?=.*[[:^alnum:]]) # Must contain a symbol
# /x

  # validates :password,
    # format: {
    #   message: ->(object, data) do
    #     if object.password.include?(/\A(?=.{8,})/x)
    #       'Password must include a number'
    #     end
    #   end
    # },
    # format: {with: PASSWORD_FORMAT},
    # length: { minimum: 8, maximum: 30,
    #   too_short: "Passwords must longer than 5 characters",
    #   too_long: "Passwords must shorter than 30 characters"
    # },
    # presence: {
    #   message: ->(object, data) do
    #     if object.password = ""
    #       errors.add(:password, 'Password cannot be blank')
    #     end
    #   end
    # }
    # presence: { message: 'Password cannot be blank' }


  # validates :access, presence: true

  # validates :user_name, :email, :access, :first_name, :last_name, :gender, :birth_day, :birth_month, :birth_year, :house_number, :street_name, :city_town, :state, :zip_code, presence: true
  # validates :user_name, :email, uniqueness: true

  # validates :password, format: {with: PASSWORD_FORMAT}

end
