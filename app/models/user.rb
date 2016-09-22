class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  belongs_to :groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :assign_group



  private
  #This will assign the FIRST USER TO SIGN UP as Administrator!!!
  def assign_group
    if self.id == 1
      self.group_id = 1
    end
  end


end
