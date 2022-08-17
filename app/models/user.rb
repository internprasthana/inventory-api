class User < ApplicationRecord
  has_secure_password

 validates :email, presence: true, uniqueness: true
 validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
 validates :username, presence: true, uniqueness: true


 before_validation :remove_whitespaces
 def remove_whitespaces
    puts"checking validations"
  end

  after_validation :set_status
  def set_status
      puts"passed all validation"
  end

  before_save :bef_save
  def bef_save
    puts"this is before save"
  end

  before_create :bef_create
  def bef_create
    puts"this is befcreate"
  end

  after_create :aft_create
  def aft_create
    puts"created successfully"
  end

  after_save :aft_save
  def aft_save
    puts"saved successfully"
  end

  after_commit :aft_commit
  def aft_commit
    puts"this after commit"
  end

  before_update :bef_update
  def bef_update
    puts"this is before update"
  end

  after_update :aft_update
  def aft_update
    puts"this is after update"
  end

  after_save :aft_save
  def aft_save
    puts"this is after save"
  end

  before_destroy :bef_destroy
  def bef_destroy
    puts"this is before destroy"
  end

  after_destroy :aft_destroy
  def aft_destroy
    puts"deleted successfully"
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
  
end
