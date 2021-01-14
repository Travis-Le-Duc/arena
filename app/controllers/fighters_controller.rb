class FightersController < ApplicationController
  def index
		@fighters = Fighter.all
  end

	def show
		if Fighter.exists?(id: params[:id])
			@fighter = Fighter.find(params[:id])
		else
			render plain: "Fighter not found"
		end
	end

	def new
		@fighter = Fighter.new
	end

	def create
		@fighter = Fighter.new(
			name:		params[:fighter][:name],
			health: params[:fighter][:health],
			attack: params[:fighter][:attack]
		)

		if @fighter.save
			redirect_to @fighter
		else
			render :new
		end
	end

	def edit
		@fighter = Fighter.find(params[:id])
		render :new
	end

	def update
		@fighter = Fighter.find(params[:id])

		if @fighter.update(
			name:		params[:fighter][:name],
			health: params[:fighter][:health],
			attack: params[:fighter][:attack]
		)
			redirect_to @fighter
		else
			render :new
		end
	end

	def destroy
		if Fighter.exists?(id: params[:id])
			@fighter = Fighter.find(params[:id])
			@fighter.destroy

			redirect_to fighters_path
		else
			render plain: "Fighter not found"
		end
	end
end
