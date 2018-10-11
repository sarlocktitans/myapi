class AddAndDropColumnsToEnquiries < ActiveRecord::Migration[5.2]
  def change
  	remove_column 	:enquiries, :user_id
  	add_column 		:enquiries, :first_name,	:string
  	add_column 		:enquiries, :last_name,		:string
  	add_column 		:enquiries, :email, 		:string
  end
end
