class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @teams = Team.find(params[:id])
  end

  def show_players
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
  end

  def create
    team = Team.new({
      name: params[:team][:name],
      city: params[:team][:city],
      rank: params[:team][:rank],
      stadium: params[:team][:stadium]
    })

    team.save

    redirect_to '/teams'
  end
end