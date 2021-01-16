class DuelsController < ApplicationController
  def index
		@duels = Duel.all
  end

	def show
		if Duel.exists?(id: params[:id])
			@duel= Duel.find(params[:id])
		else
			render plain: "Duel not found"
		end
	end

	def new
		@duel = Duel.new
		@fighters = Fighter.all.map { |f| [f.name, f.id] }
	end

	def create
		fighters = Fighter.where(id: [params[:fighter_id1], params[:fighter_id2]])

		if fighters.length == 2
			@duel = DuelService.new(fighters.first, fighters.last).execute
			@duel.save
			redirect_to @duel
		else
			@fighters = Fighter.all.map { |f| [f.name, f.id] }
			render :new
		end
	end
end
