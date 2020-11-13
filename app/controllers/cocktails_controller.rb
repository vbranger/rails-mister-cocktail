class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.where(cocktail_id: params[:id])
    @cocktail = Cocktail.find(params[:id])
    if @doses.length != 0
      @background_color = main_background_color(@doses)
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :glass_type)
  end

  def main_background_color(doses)
    lum = []
    colors = []
    doses.each do |dose|
      color = Color.new(Ingredient.find(dose.ingredient_id).color)
      colors << Ingredient.find(dose.ingredient_id).color
      lum << color.l
    end
    return colors[lum.index(lum.min)]
  end

end
