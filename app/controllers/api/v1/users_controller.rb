class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    if (users.length > 1)
      render json: users
    else
      render json: {
        "status": 204,
        "message": "No users available."
      }
    end
  end

  def show
    user = find_user
    if user
      render json: user
    else
      render json: get_404_error_msg()
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { user: UserSerializer.new(user) }, status: :created
    else
      render json: { 
        "errors": user.errors,
        "error_codes": user.errors.keys.map { |f| "#{f.upcase}_ERROR" },
        "error": 'Unable to create the user'
      }, status: :not_acceptable
    end
  end

  def update
    user = find_user
    if user
      # User found, proceed with other operations on it...
      user.update(user_params)
      if user.valid?
        result = { json: {
            "status": 200,
            "message": "User updated successfully",
            "user": user
          }
        }
      else
        result = { json: { "status": 400, "message": "Bad request" } }
      end
    else
      result = { json: get_404_error_msg }
    end
    render(result)
  end

  def destroy
    user = find_user
    if user
      # User found, proceed with other operations on it...
      if user.destroy
        final_json = { json: { "status": 204, "message": "User '#{user.first_name} #{user.last_name}', successfully deleted." } }
      else
        final_json = { json: get_404_error_msg("Unable to delete the user '#{user.first_name} #{user.last_name}'.") }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  private
    def user_params
      params.require(:user).permit(
        :username,
        :password_digest,
        :type,
        :bio,
        :picture,
        :phone_number,
        :email_address,
        :physical_address,
        :name, # merchant
        :first_name, # customer
        :middle_name, # customer
        :last_name, # customer
        :fax_number, # merchant
        :website, # merchant
        :business_hours # merchant
      )
    end

    def find_user
      User.find_by(id: params[:id])
    end

    def get_404_error_msg(msgTxt = "User not found.")
      return { "status": 404, "message": msgTxt };
    end

end

