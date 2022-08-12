class Employee < ApplicationRecord
  # validates :email, presence: true, uniqueness: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :name, presence: true, uniqueness: true
   validates :phone_number, presence:true
  has_many :devices


  before_save { self.email = email.downcase }
  has_many :devices, dependent: :destroy
  validates :name, presence: true,length: { minimum: 3 }
  validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i },
                    presence: true,uniqueness: { case_sensitive: false },length: { maximum: 105 }
  # validates :password,presence: true,length:{minimum: 5 }
  #
  # has_secure_password


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
end
