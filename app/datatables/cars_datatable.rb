class CarsDatatable
  delegate 

  

  private

  	def count 
  	  Car.count
  	end
  	def data
  	end

  	def total_entries
  	  cars.total_entries
  	end

  	def cars
  	  @cars ||= fetch_cars
  	end

  	def fetch_cars
  	  search_string = []
  	  columns.each do |term|
  	  	search_string << "#{term} like :search"
  	end
  	users = User.page(page).per(per_page)
end