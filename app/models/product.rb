class Product < ApplicationRecord
  belongs_to :user
  belongs_to :exhibitor, class_name: "User" , optional: true,foreign_key: "exhibitor_id"
  belongs_to :buyer, class_name: "User", optional: true,foreign_key: "buyer_id"
  belongs_to :category
  has_one :order
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  has_many :favorites, dependent: :destroy
  has_many :favorites, through: :favorites

  validates :buyer_id, presence: true, allow_blank: true
  validates :size, :status, :name, :estimated_delivery, :shipping_fee_burden, :prefectures, :amount_of_money, :product_details, :shipping_method, presence: { message:'入力してください。'}
  validates :category_id, presence: true
  validates :images, presence: { message:'画像を追加してください。'}
end
