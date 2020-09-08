class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :last_name
    validates :family_name_kana
    validates :last_name_kana
  end

  validates :password, length: { minimum: 6 }, message:'は6文字以上を設定して下さい'
  validates :password_confirmation, length:{ minimum: 6 }, message: 'は6文字以上を設定して下さい'

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates_format_of :password_confirmation, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  
  has_many :items
  has_many :purchases
end
