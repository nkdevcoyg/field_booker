class FieldsController < ApplicationController

  def index
    @fields = Field.all
  end

  def show
    @field = Field.find(params[:id])
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)

    if @field.save
      redirect_to @field, notice: "Field was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @field = Field.find(params[:id])
  end

  def update
    @field = Field.find(params[:id])

    if @field.update(field_params)
      redirect_to
      0
    else
      render :edit
    end
  end

  def destroy
    @field = Field.find(params[:id])
    @field.destroy

    redirect_to root_path

  end

  private

  def check_if_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_field
    @field = Field.find(params[:id])
  end

  def field_params
    params.require(:field).permit(:title, :location, :price, :size, :field_coverage, :field_id)
  end
end

