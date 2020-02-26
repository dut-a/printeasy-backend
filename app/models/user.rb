class User < ApplicationRecord
  # Picture things
  mount_uploader :picture, PictureUploader

  # Associations
  has_many :prints
  has_many :addresses
  has_many :services

  # security
  has_secure_password

  # Validations
  FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  NAME_REGEX = /\A[^0-9`!@#\$%\^&*+_=]+\Z/i
  PHONE_REGEX = /\A\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*\Z/i
  URL_REGEX = Regexp.escape('/[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi')

  # Source: https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch04s01.html
  PASSWORD_REGEX = /\A[A-Z0-9+_.-]+@[A-Z0-9.-]+\Z/i

  validates :username,
            :password,
            :user_type,
            :bio,
            :picture,
            :phone_number,
            :email_address,
            :physical_address,
            :name,
            :first_name,
            :middle_name,
            :last_name,
            :fax_number,
            :website,
            :business_hours, presence: true

  validates :username,
            :name,
            :first_name,
            :middle_name,
            :last_name,
              :length => { :within => 3..25 },
              :format => NAME_REGEX

  validates :username, :uniqueness => true

  validates :email_address,
              :length => { :maximum => 100 },
              :format => EMAIL_REGEX,
              :confirmation => true

  validates :password, :format => PASSWORD_REGEX

  validates :bio, :length => { :within => 5..250 }

  validates :phone_number, :fax_number, :format => PHONE_REGEX

  validates :picture, file_size: { less_than: 10.megabytes }

  validates :website, :format => URL_REGEX

  validates :picture,
            :name,
            :first_name,
            :middle_name,
            :last_name,
            :fax_number,
            :website,
            :business_hours, allow_blank: true

  validate :username_allowed

  private
    def username_allowed
      if FORBIDDEN_USERNAMES.include?(username)
        errors.add(:username, "has been restricted from being used here.")
      end
    end

end

