class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @team = Team.find(params[:id])
    @player = Player.new
  end

  def create
    @team = Team.find(params[:team_id])
    player = Player.new({
      name: params[:player][:name],
      drafted: params[:player][:drafted],
      jersey_num: params[:player][:jersey_num]
      
    })

    player.save

    redirect_to team_players_path(@team)
  end
end