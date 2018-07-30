class EmployeesController < ApplicationController

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show #set_employee
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.valid
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def edit #set_employee
  end

  def update #set_employee
    if @employee.update(employee_params)
    redirect_to employee_path
    else
    render :edit
    end
  end

  def destroy #set_employee
    @employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end
end
