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
      redirect_to @field
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
  def field_params
    params.require(:field).permit(:title, :location, :price, :duration, :size, :field_coverage)
  end
end

