class BookingsController < ApplicationController

  def index
    @bookings = Booking.where("user_id = ? AND ends >= ?", @user_id, Time.now).order(:starts)

  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @user = User.new
    @booking = Booking.new(user_id: @user.id)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking =  Booking.new(params[:booking].permit(:user_id, :starts, :ends))
    @booking.user = @user
    if @booking.save
      redirect_to user_bookings_path(@user, method: :get)
    else
      render 'new'
    end
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(params[:booking].permit(:user_id, :starts, :ends))
      flash[:notice] = 'Your booking was updated'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to user_bookings_path(@user)
      end
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was deleted'}
      format.json { head :no_content}
    end
  end

  def correct_user
    @booking = Booking.find(params[:id])
    unless current_user == @booking.user
      redirect_to(@booking, notice: "You cannot perform this action")
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:field_id, :starts, :ends, :price)
  end

  private

def save_booking
  if @booking.save
    flash[:notice] = 'booking added'
    redirect_to user_booking_path(@user, @booking)
  else
    render 'new'
  end
end


  def find_user
    if params[:user_id]
      @user = User.find_by_id(params[:client_id])
    end
  end
end

# def index
  #     @bookings = current_user.all_reservations_sorted
  #   end
  #
  #   def show
  #     if !current_user.bookings.exists?(params[:id])
  #       flash[:msg] = "Reservation not found"
  #       redirect_to bookings_path
  #     else
  #       @single_booking = current_user.reservations.find_by(id: params[:id])
  #       @field = @single_booking.field
  #       render :'fields/show.html.erb'
  #     end
  #   end