class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy
  #has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  #has_many :followed_users, through: :relationships, source: :followed
  #has_many :reverse_relationships, foreign_key: "followed_id",
  #                                 class_name: "Relationship",
  #                                 dependent: :destroy
  #has_many :followers, through: :reverse_relationships, source: :follower

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  #def following?(other_user)
  #  relationships.find_by_followed_id(other_user.id)
  #end

  # def follow!(other_user)
  # relationships.create!(followed_id: other_user.id)
  # end
  #
  # def unfollow!(other_user)
  # relationships.find_by_followed_id(other_user.id).destroy
  # end
  #
   def feed
      #Micropost.from_users_followed_by(self)
      #Micropost.where("user_id = ?", id)

      microposts
   end

  # This defines the paypal url for a given product sale
  def self.paypal_url()
    values = {
      :business => 'mukteshwarpd@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => 'http://103.248.84.98:3000/',
      :invoice => 'mukteshwar00009'
    }

    values.merge!({
      "amount_1" => 10,
      "item_name_1" => 'patanjlihing',
      "item_number_1" => 1,
      "quantity_1" => '1'
    })

    # This is a paypal sandbox url and should be changed for production.
    # Better define this url in the application configuration setting on environment
    # basis.
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query

  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
