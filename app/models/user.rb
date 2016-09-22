class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
	validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 6, maximum: 80}, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :groups

  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :user_jobs
  has_many :jobs, through: :user_jobs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :assign_group

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  private
  #This will assign the FIRST USER TO SIGN UP as Administrator!!!
  def assign_group
    if self.id == 1
      self.group_id = 1
    end
  end


end
