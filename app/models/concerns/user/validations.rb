module User::Validations 
    extend ActiveSupport::Concern

    included do 

        validates :first_name, :last_name, {
            presence: true
        }

        validates :email, {
            uniqueness: {
              message: "is already in use"
            },
            format: {
              with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
              message: "format is invalid"
            },
        }

        validates :password, {
            presence: true,
            on: :create
          }

    end

end