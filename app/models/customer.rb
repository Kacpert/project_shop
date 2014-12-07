class Customer < ActiveRecord::Base
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :favorited, source_type: 'Favorites'
  has_many :shopcart_products, through: :favorites, source: :favorited, source_type: 'Shopcart'
  attr_accessor :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 9 }, length: { minimum: 9 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :zip_code, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }



  def Customer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Customer.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


    # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Customer.new_token
    update_attribute(:reset_digest,  Customer.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    CustomerMailer.password_reset(self).deliver
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end



  private
  def downcase_email
      self.email = email.downcase
    end

  def create_activation_digest
    self.activation_token  = Customer.new_token
    self.activation_digest = Customer.digest(activation_token)
  end

end