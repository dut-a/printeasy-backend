class Api::V1::ServicesController < ApplicationController

  def index
    services = Service.all
    if (services.length > 1)
      render json: services
    else
      render json: {
        "status": 204,
        "message": "No services available."
      }
    end
  end

  def show
    service = find_service
    if service
      render json: service
    else
      render json: get_404_error_msg()
    end
  end

  def create
    service = Service.create(service_params)
    if service.valid?
      render json: { service: ServiceSerializer.new(service) }, status: :created
    else
      render json: { 
        "errors": service.errors,
        "error_codes": service.errors.keys.map { |f| "#{f.upcase}_ERROR" },
        "error": 'Unable to create the service'
      }, status: :not_acceptable
    end
  end

  def update
    service = find_service
    if service
      # Service found, proceed with other operations on it...
      service.update(service_params)
      if service.valid?
        result = { json: {
            "status": 200,
            "message": "Service updated successfully",
            "service": service
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
    service = find_service
    if service
      # Service found, proceed with other operations on it...
      if service.destroy
        final_json = { json: { "status": 204, "message": "Service number '#{service.id}', successfully deleted." } }
      else
        final_json = { json: get_404_error_msg("Unable to delete the service number '#{service.id}'.") }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  private
    def service_params
      params.require(:service).permit(
        :type,
        :cost,
        :time_to_complete,
        :user_id
      )
    end

    def find_service
      Service.find_by(id: params[:id])
    end

    def get_404_error_msg(msgTxt = "Service not found.")
      return { "status": 404, "message": msgTxt };
    end

end

