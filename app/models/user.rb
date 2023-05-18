class User < ApplicationRecord
  delegate :can?, :cannot, to: :ability
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :reservations, dependent: :destroy
  has_many :cars, through: :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validate :confirmation_password_match

  before_create :assign_role

  def ability
    @ability ||= Ability.new(self)
  end

  def confirmation_password_match
    return unless password != password_confirmation

    errors.add(:confirmation_password, 'must match password')
  end

  def admin?
    role == 'admin'
  end

  private

  def assign_role
    self.role = User.count.zero? ? 'admin' : 'user'
  end
end
