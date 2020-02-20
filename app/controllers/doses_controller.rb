class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def index
    @doses = Dose.all
  end


  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @cocktail.doses.each do |dose|
      if dose == @dose
        dose.destroy
      end
    end
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
