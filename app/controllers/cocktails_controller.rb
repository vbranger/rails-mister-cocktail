class CocktailsController < ApplicationController

  def random_3
    @cocktails = Cocktail.all
    @cocktails = @cocktails.shuffle[0..2]
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.where(cocktail_id: params[:id])
    @cocktail = Cocktail.find(params[:id])
    @background_color = main_background_color(@doses)
    if @doses.length != 0
      @fractions = ratio(@doses)
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
    if doses.length == 0
      return '#f2f2f2'
    end
    lum = []
    colors = ['#f2f2f2']
    doses.each do |dose|
      color = Color.new(Ingredient.find(dose.ingredient_id).color)
      colors << Ingredient.find(dose.ingredient_id).color
      lum << color.l
    end
    return colors[lum.index(lum.min)]
  end

  def ratio(doses)
    fractions = []
    doses.each do |dose|
      unit = Unit.find(dose.unit_id).value
      quantity = dose.quantity
      total = unit * quantity.to_f
      fractions << "#{total}fr"
    end
    return fractions.join(" ")
    # return a string like : '128fr 64fr 8fr 4fr 5.33fr'
  end

end
