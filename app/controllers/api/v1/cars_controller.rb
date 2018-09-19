module Api
  module V1

    class CarsController < ApiController

      def index
    	cars = Car.all
      cars_pages = cars.each_slice(10).to_a 
      cars_pages = cars_pages[0]
      render json: {status: 'SUCCESS', message:'loading list', data:cars_pages},status: :ok
      end

      def create
        car = Car.new(user_params)
        
        if car.save
          render json: {status: 'SUCCESS', message:'saving car', data:car},status: :ok
        else
          render json: {status: 'ERROR', message:'car not saved', data:car.errors},
                                                          status: :unprocessable_entity
        end
      end

      def show
        car = Car.find(params[:id])
        render json: {status: 'SUCCESS', message:'loading list', data:car},status: :ok
      end

      def destroy
        car = Car.find(params[:id])
        if car.destroy
          render json: {status: 'SUCCESS', message:'Destroyed car', data:car},status: :ok
        else
          render json: {status: 'ERROR', message:'car not saved', data:car.errors},
                                                          status: :unprocessable_entity
        end
      end
      private

      def user_params
        params.require(:cars).permit(:name, :price, :location, :is_featured, 
        							  :image, :model, :registration_date,
    							       :description, :manufacturer)
      end

      def search
        if(params[:type] == "new car")
          car = Car.where("name like?", "%#{params[:name]}%")
        else
          car = Car.where("#{params[:min]} AND #{params[:max]}")
        end
        render json: {status: 'SUCESS', message: 'searching cars', data:car},status: :ok
      end
    end
  end
end
