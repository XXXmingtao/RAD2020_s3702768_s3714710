class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
    before_save :downcase_email
    before_create :create_activation_digest
    validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:   true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    VALID_PHONE_REGEX = /\d{10,13}/
    validates :phone, presence: true, length: {maximum: 13 }, format: {with: VALID_PHONE_REGEX }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    before_save { self.email = email.downcase }
    has_secure_password
    VALID_PASS_REGEX = /[a-zA-Z0-9]{8,20}/
    validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASS_REGEX }, allow_nil:true
    validates :address, presence: true, length: {maximum: 45 }, allow_blank: true
    validates :userbio, presence: true, allow_blank: true
    VALID_STUDENT_NAME_REGEX = /\A[a-zA-Z\s]+\Z/
    VALID_CARD_NUM_REGEX = /\d{7}/
    validates :student_name, presence: true, length: {maximum: 50 }, format: {with: VALID_STUDENT_NAME_REGEX }, allow_nil:true
    validates :card_num, presence: true, length: {maximum: 7 }, format: {with: VALID_CARD_NUM_REGEX }, allow_nil:true
    has_many :posts
    has_one_attached :avatar
    has_one_attached :verifycard

    


    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token=User.new_token
        update_attribute(:remember_digest,User.digest(remember_token))
    end

    def authenticated?(attribute,token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    def forget
        update_attribute(:remember_digest,nil)
    end

    # Activates an account.
    def activate
        update_attribute(:activated,true)
        update_attribute(:activated_at,Time.zone.now)
    end
    
    # Sends activation email.
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end

    # Sets the password reset attributes.
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest,User.digest(reset_token))
        update_attribute(:reset_sent_at,Time.zone.now)
    end
    
    # Sends password reset email.
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    # Returns true if a password reset has expired.
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end

    private
        def downcase_email
            self.email = email.downcase
        end

        def create_activation_digest
            self.activation_token = User.new_token
            self.activation_digest = User.digest(activation_token)
        end
end
