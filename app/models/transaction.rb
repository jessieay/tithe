class Transaction < ActiveRecord::Base
  attr_accessible :amount, :organization_id, :user_id, :stripe_card_token
  attr_accessor :stripe_card_token

  belongs_to :user
  belongs_to :organization

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(:description => self.user.email, :card => stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
