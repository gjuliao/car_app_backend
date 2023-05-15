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
  before_create :assign_role

  def ability
    @ability ||= Ability.new(self)
  end

  def admin?
    role == 'admin'
  end

  private

  def assign_role
    self.role = User.count.zero? ? 'admin' : 'user'
  end
end
