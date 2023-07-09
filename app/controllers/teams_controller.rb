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
end