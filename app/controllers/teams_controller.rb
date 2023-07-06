class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @teams = Team.find(params[:id])
  end
end