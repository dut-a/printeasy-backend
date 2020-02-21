class Api::V1::AddressesController < ApplicationController

  def index
    addresses = Address.all
    if (addresses.length > 1)
      render json: addresses
    else
      render json: {
        "status": 204,
        "message": "No addresses available."
      }
    end
  end

  def show
    address = find_address
    if address
      render json: address
    else
      render json: get_404_error_msg()
    end
  end

  def create
    address = Address.create(address_params)
    if address.valid?
      render json: { address: AddressSerializer.new(address) }, status: :created
    else
      render json: { 
        "errors": address.errors,
        "error_codes": address.errors.keys.map { |f| "#{f.upcase}_ERROR" },
        "error": 'Unable to create the address'
      }, status: :not_acceptable
    end
  end

  def update
    address = find_address
    if address
      # Address found, proceed with other operations on it...
      address.update(address_params)
      if address.valid?
        result = { json: {
            "status": 200,
            "message": "Address updated successfully",
            "address": address
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
    address = find_address
    if address
      # Address found, proceed with other operations on it...
      if address.destroy
        final_json = { json: { "status": 204, "message": "Address '#{address.line_1}, #{address.line_2}', successfully deleted." } }
      else
        final_json = { json: get_404_error_msg("Unable to delete the address '#{address.line_1}, #{address.line_2}'.") }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  private
    def address_params
      params.require(:address).permit(
        :line_1,
        :line_2,
        :city,
        :state,
        :zip,
        :user_id
      )
    end

    def find_address
      Address.find_by(id: params[:id])
    end

    def get_404_error_msg(msgTxt = "Address not found.")
      return { "status": 404, "message": msgTxt };
    end

end

