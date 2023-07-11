class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @teams = Team.find(params[:id])
    @team = @teams
  end

  def show_players
    @team = Team.find(params[:id])
    @players = @team.players.order(:name)
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

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update({
      name: params[:team][:name],
      city: params[:team][:city],
      rank: params[:team][:rank],
      stadium: params[:team][:stadium]
    })

    redirect_to "/teams/#{team.id}"
  end

  def destroy
    @team = Team.find_by(id: params[:id])
    @team.destroy if @team
    redirect_to '/teams'
  end
end