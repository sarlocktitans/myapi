module Api
  module V1
	class EnquiriesController < ApiController
		
		def index
			@enquiries = Enquiry.all
		end

		def new
			@enquiry = Enquiry.new(enquiry_params)

		end

		def create
			@enquiry = Enquiry.new(enquiry_params)
			@enquiry.car_id = (Car.find_by_name(params[:enquiry][:car_name])).id 
			if(@enquiry.save && @enquiry.car_id)
				render json: {status: 'SUCCESS', message: 'Enquiry saved successfully'},status: :ok
			else
				 render json: {status: 'ERROR', message:'Enquiry not saved', data:@enquiry.errors},
	                                                          status: :unprocessable_entity
			end
		end

		def enquiry_params
			params.require(:enquiry).permit(:first_name, :last_name, :email, :comment)
		end

		def car_names
			cars = Cars.all
			car_names = []
			cars.each do |car|
				car_names.push(car)
			end 
			render json: {status: 'SUCCESS', message: "Car names list", data:car_names},status: :ok
		end
	end
  end
end