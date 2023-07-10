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
    
    puts "Team ID: #{@team.id}"
    puts "Player params: #{params[:player]}"
  
    player = Player.new({
      name: params[:player][:name],
      drafted: params[:player][:drafted],
      jersey_num: params[:player][:jersey_num],
      team: @team
    })

    puts "New Player: #{player.inspect}"
    player.save
    redirect_to team_players_path(@team)
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update({
      name: params[:player][:name],
      drafted: params[:player][:drafted],
      jersey_num: params[:player][:jersey_num],
    })

    redirect_to "/players/#{player.id}"
  end
end