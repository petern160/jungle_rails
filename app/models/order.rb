class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true


  after_create :welcome_send
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
  end
end
