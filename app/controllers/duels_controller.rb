class DuelsController < ApplicationController
  def index
    @duels = Duel.all
  end

  def show
    if Duel.exists?(id: params[:id])
      @duel = Duel.find(params[:id])
      @loser = @duel.winner.id == @duel.fighter1.id ? @duel.fighter2 : @duel.fighter1
    else
      render plain: 'Duel not found'
    end
  end

  def new
    @duel = Duel.new
    @fighters = Fighter.all.map { |f| [f.name, f.id] }
    @equipments = Equipment.all.map { |e| [e.name, e.id] }
  end

  def create
    fighters = Fighter.where(id: [params[:fighter1][:id], params[:fighter2][:id]])

    if fighters.length == 2
      fighter1 = fighters.first
      fighter2 = fighters.last
      equipments = Equipment.where(id: params[:equipment_ids])

      @duel = DuelService.new(fighter1, fighter2, equipments).execute
      @duel.save
      redirect_to @duel
    else
      @duel = Duel.new
      @fighters = Fighter.all.map { |f| [f.name, f.id] }
      @equipments = Equipment.all.map { |e| [e.name, e.id] }
      render :new
    end
  end
end
