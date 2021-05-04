class PokemonsController < ApplicationController
  def index
    page = params[:page].present? && is_numeric?(params[:page]) ? params[:page] : 1
    per_page = params[:per_page].present? && is_numeric?(params[:per_page]) ? params[:per_page] : 20
    render json: Pokemon.all.paginate(page: page, per_page: per_page)
  end

  def show
    pokemon = Pokemon.find_by(id: params[:id])
    render json: pokemon
  end

  def create 
    pokemon = Pokemon.create(pokemon_params)
    if pokemon.errors.present?
      render json_errors(pokemon.errors.full_messages)
    else
      render json: pokemon
    end
  end

  def update
    pokemon = Pokemon.find_by(id: params[:id])
    if pokemon.present?
      pokemon.update(pokemon_params)
      if pokemon.errors.present?
        render json_errors(pokemon.errors.full_messages)
      else
        render json: pokemon
      end
    else
      render json_errors("No pokemon with this id")
    end
  end

  def destroy
    pokemon = Pokemon.find_by(id: params[:id])
    if pokemon.present?
      pokemon.destroy
      render json: pokemon
    else
      render json_errors("No pokemon with this id")
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(Pokemon.permitted_params)
  end

  def is_numeric?(obj) 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
 end
end
