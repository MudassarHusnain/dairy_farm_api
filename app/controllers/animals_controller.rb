class AnimalsController <ApplicationController

  def index
    @animals=Animal.all
    @animals.each do|animal|
       if animal.picture.attached?
         animal.image="http://localhost:3000"+Rails.application.routes.url_helpers.rails_representation_url(animal.picture, only_path: true)

      else

      end
    end
    render json: @animals,status:200
  end
  def show
    @animal=Animal.find_by(id:params[:id])
    if @animal.picture.attached?
      @animal.image="http://localhost:3000"+Rails.application.routes.url_helpers.rails_representation_url(@animal.picture, only_path: true)

      else

      end
    render json: @animal,status: 200
  end
  def create
    # debugger
    @animal=Animal.new(picture:params[:picture],date_of_birth:params[:date_of_birth],status:params[:status])
    if @animal.save
      render json: {
        status:"ok",message:"Animal is created successfully"
      }
    else
      render json: {
        status:401,message:"There is an something went wrong"
      }
    end
  end
  def update
    @animal=Animal.find_by(params[:id])
    if @animal.update(date_of_birth:params[:date_of_birth],status:params[:status],picture:params[:picture])
      render json: message
    end
  end
  def destroy
    @animal=Animal.destroy(params[:id])
    if @animal
      render json: {message:"#{params[:id]} no is deleted successfully",status:200}
    else
      render json: {error:"Animal is not deleted"}
    end
  end
  private
  def animal_params
    params.require(:animal).permit(:picture,:date_of_birth,:status)
  end
end