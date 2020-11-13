module ApplicationHelper

  def main_background_color(doses)
    if doses.length != 0
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

  def ratio(doses)
    if doses.length != 0
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
end
