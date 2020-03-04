class Api::V1::PrintsController < ApplicationController

  def index
    prints = Print.all
    if (prints.length > 1)
      render json: prints
    else
      render json: {
        "status": 204,
        "message": "No prints available."
      }
    end
  end

  def show
    print = find_print
    if print
      render json: print
    else
      render json: get_404_error_msg()
    end
  end

  def create
    print = Print.create(print_params)
    if print.valid?
      render json: { print: PrintSerializer.new(print) }, status: :created
    else
      render json: { 
        "errors": print.errors,
        "error_codes": print.errors.keys.map { |f| "#{f.upcase}_ERROR" },
        "error": 'Unable to create the print'
      }, status: :not_acceptable
    end
  end

  def update
    print = find_print
    if print
      # Print found, proceed with other operations on it...
      print.update(print_params)
      if print.valid?
        result = { json: {
            "status": 200,
            "message": "Print updated successfully",
            "print": print
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
    print = find_print
    if print
      # Print found, proceed with other operations on it...
      if print.destroy
        final_json = { json: { "status": 204, "message": "Print number '#{print.id}', successfully deleted." } }
      else
        final_json = { json: get_404_error_msg("Unable to delete the print number '#{print.id}'.") }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  private
    def print_params
      params.permit(
        :print_type,
        :number_of_copies,
        :ordered_by,
        :fulfilled_by,
        :payment_method,
        :payment_status,
        :pickup_location,
        :pickup_type,
        :delivery_address,
        :placed_on,
        :estimated_completion_time,
        :status,
        :user_id,
        :service_id
      )
    end

    def find_print
      Print.find_by(id: params[:id])
    end

    def get_404_error_msg(msgTxt = "Print not found.")
      return { "status": 404, "message": msgTxt };
    end

end

