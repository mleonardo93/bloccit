class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  before_save { self.email = email.downcase if email.present? }
  before_save { self.name = name.split(" ").each{|word| word.capitalize!}.join(" ") if name }
  before_save { self.role ||= :member }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  # This differs from how it's written in the checkpoint because I was getting an error. 
  # I'm still not sure where the error comes from, but I've asked in Slack.
  validates :password, presence: true, length: { minimum: 6 } if :password_digest.nil?
  
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 254 }
  has_secure_password

  enum role: [:member, :admin]
end