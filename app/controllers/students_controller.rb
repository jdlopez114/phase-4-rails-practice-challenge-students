class StudentsController < ApplicationController

    def index
        render json: Student.all, adaptor: nil, except: [ :created_at, :updated_at ], status: 200
    end

    def show
        render json: Student.find( params[:id] ), status: 302
    end

    def create 
        render json: Student.create( student_params )
    end

    def update
        #find the record we want to change
        i = Student.find( params[:id] )
         #change it
        i.update!( student_params )
        #create a response
        render json: i, status: :ok
    end

    def destroy
        i = Student.find( params[:id] )
        i.destroy 
        head :no_content 
    end

    private 

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end
