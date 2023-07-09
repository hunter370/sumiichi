class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :icon
  has_many :supports, dependent: :destroy
  
  def get_icon(width, height)
  unless icon.attached?
    file_path = Rails.root.join('app/assets/images/ball.png')
    icon.attach(io: File.open(file_path), filename: 'default-icon.png', content_type: 'image/png')
  end
  icon.variant(resize_to_limit: [width, height]).processed
  end
  
 def active_for_authentication?
    super && (is_deleted == false)
 end
end
