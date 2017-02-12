class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable, :omniauthable
  enum role: {admin: 0, kanri: 1, sales: 2, teamleader: 3, member: 4}

  def self.find_for_google_oauth(auth, signed_in_resource=nil)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    unless user
      user = User.new(
        name:     auth.info.name,
        email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
        provider: auth.provider,
        uid:      auth.uid,
        token:    auth.credentials.token,
        password: Devise.friendly_token[0, 20],
        role: 4
        )
      # user.skip_confirmation!
      user.save(validate: false)
    end
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def update_with_password(params, *options)
    if provider.blank?
      super
    else
      params.delete :current_password
      update_without_password(params, *options)
    end
  end
end
