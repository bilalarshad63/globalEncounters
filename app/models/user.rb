class User < ApplicationRecord
  before_validation :add_username_in_db
  attr_accessor :skip_password_validation
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :image

  validates :password, presence: true, unless: :skip_password_validation
  validates :password, confirmation: { case_sensitive: true }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true, format: { with: /(?:\+?\d{1,3}[- ]?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{2}[- ]?\d{2}/, message: 'only allows numbers' }, length: { in: 7..25 }

  def self.search(search)
    if search
      where('username LIKE ? OR email LIKE ? OR id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def add_username_in_db
    self.username = "#{first_name} #{last_name}"
  end

  private

  def password_required?
    return false if skip_password_validation

    super
  end
end
