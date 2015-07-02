class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_info, dependent: :destroy
  has_many :writings, dependent: :destroy

  validates_presence_of :username , :on => :create, :message => "can't be blank"

end
