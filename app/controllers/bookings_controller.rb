class BookingsController < ApplicationController
#   def index
#   @bookings = Booking.all
# end
#
# def show
#   @booking = Booking.find(params[:id])
# end
#
# def new
#   @booking = Booking.new
# end
#   def edit
#     @booking = Booking.find(params[:id])
#   end
#
# def create
#   @booking = Booking.new(booking_params)
#
#   if @booking.save
#     redirect_to @booking, notice: "Field was successfully created."
#   else
#     render :new, status: :unprocessable_entity
#   end
# end
#
# def update
#   @booking = Booking.find(params[:id])
#
#   if @booking.update(booking_params)
#     redirect_to
#   else
#     render :edit
#   end
# end
#
# def destroy
#   @booking = Booking.find(params[:id])
#   @booking.destroy
#
#   redirect_to root_path
#
# end
#
# private
#
# def booking_params
#   params.require(:booking).permit(:title, :price, :booking_date, :end_date, :user_id, :booking_id)
# end
#
  def index
  @bookings = Booking.all
  end

  def show
  @booking = Booking.find(params[:id])
  end

  def new
  @booking = Booking.new
  end

  def create
  @booking = Booking.new(booking_params)

  if @booking.save
    redirect_to @booking, notice: "Event was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
  end

  def edit
  @booking = Booking.find(params[:id])
  end

  def update
  @booking = Booking.find(params[:id])

  if @booking.update(booking_params)
    redirect_to @booking
  else
    render :edit
  end
  end

  def destroy
  @booking = Booking.find(params[:id])
  @booking.destroy

  redirect_to root_path
  end

  private
  def booking_params
  params.require(:booking).permit(:title, :price, :booking_date, :end_date, :user_id, :field_id)
  end
end
