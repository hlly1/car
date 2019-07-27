class User < ApplicationRecord
  before_save {self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 10 }
  
  validates :email, presence: true, length: { maximum: 200 },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  ALID_PASSWD_REGEX = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$&+,:;=?@#|'<>.^*()%!~]).{8,}$/
  validates :password, presence: true,
                      format: { with: VALID_PASSWD_REGEX, :message => 
                      "must contains at least a lowercase letter, a uppercase,
                      a digit, a special character and 8+ characters", :multiline => true}
end
