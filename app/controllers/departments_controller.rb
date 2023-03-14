class DepartmentsController < ApplicationController
  def create
    @department = Department.create(
    name: params[:name],
    manager: params[:manager],
    code: params[:code]
    )
    render json: {message: "Created Successfully"}, status: :created
  end  

  def show
    @department = Department.find_by(
      id: params[:id] 
    )
    render :show
  end  

  def index
    @departments = Department.all
    render :index
  end  
  
  def update
    @department = Department.find_by(id: params[:id])
    @department.update(
      name: params[:name] || @department.name,
      manager: params[:manager] || @department.manager,
      code: params[:code] || @department.code
    )
    if department.valid?
      render :show
    else 
      render json: {errors: @department.errors.full_messages}, status: :unprocessable_entity
    end  
  end
end
