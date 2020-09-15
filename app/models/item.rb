class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image

  validates :name, presence: true
  validates :comment, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }

  # 以下Active hash関連
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :areaofdelivery
  belongs_to_active_hash :daysunilshipping

  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :status_id, numericality: { other_than: 1 }, presence: true
  validates :deliveryfee_id, numericality: { other_than: 1 }, presence: true
  validates :areaofdelivery_id, numericality: { other_than: 1 }, presence: true
  validates :daysunilshipping_id, numericality: { other_than: 1 }, presence: true
end
