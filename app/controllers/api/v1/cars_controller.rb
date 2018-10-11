module Api
  module V1

    class CarsController < ApiController
      before_action :authenticate

      def search
        search_cars = ""
        if(params[:car_type] == "new car")
          search_cars = Car.where("name like?", "%#{params[:name]}%")
        elsif(params[:car_type] == "old car")
          search_cars = Car.where("price between #{params[:min]} and #{params[:max]}")
          search_cars = search_cars.where("location like?", "%Delhi%")
        end

        if search_cars
          cars_page = paging(search_cars)
          render json: {status: 'SUCCESS', message: 'searching cars', data:cars_page},status: :ok
        else
          render json: {status: 'SUCCESS', message: 'Not Found'},status: :ok
        end

      end

      def index
      	cars = Car.all
        if cars
          cars_page = paging(cars)
          render json: {status: 'SUCCESS', message: 'searching cars', data:cars_page},status: :ok
        else
          render json: {status: 'SUCCESS', message: 'Not Found'},status: :ok
        end
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

      def update
        car = Car.find(params[:id])
      end
      private

      def user_params
        params.require(:cars).permit(:name, :price, :location, :is_featured, 
        							  :image, :model, :registration_date,
    							       :description, :manufacturer)
      end

      def paging(cars)
        
          cars_pages = cars.each_slice(10).to_a 
          cars_page = cars_pages[0]
        
      end

    end
  end
end
