require "pry"

def game_hash 
{
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
          },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
          },
        "Brook Lopez":{
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
          },
        "Mason Plumlee":{
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
          },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
          }
        }
      },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
          },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
          },
        "DeSagna Diop":{
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
          },
        "Ben Gordon":{
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
          },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
          }
      }
    }
  }
end 

def num_points_scored (player)
  game_hash.each do |location, location_data|
    location_data.each do |location_data, player_name|
      if location_data == :players
        player_name.each do |player_name, category|
          if "#{player}" == "#{player_name}"
            category.each do |category, stats|
              if category == :points
                return stats
              end 
            end 
          end 
        end 
      end 
    end 
  end 
end 

def shoe_size (player)
  game_hash.each do |location, location_data|
    location_data.each do |location_data, player_name|
      if location_data == :players
        player_name.each do |player_name, category|
          if "#{player}" == "#{player_name}"
            category.each do |category, stats|
              if category == :shoe
                return stats
              end 
            end 
          end 
        end 
      end 
    end 
  end 
end 

def team_colors (team_name)
  variable = []
  game_hash.each do |location, location_data|
    location_data.each do |location_data, team_data|
      if "#{team_name}" == "#{team_data}"
        variable = game_hash[location][:colors]
        return variable
      end 
    end 
  end 
end 

def team_names
  array = []
  game_hash.collect do |location, location_data|
    array << game_hash[location][:team_name]
  end 
  array
end 

def player_numbers (team_name)
  array = []
  game_hash.each do |location, location_data|
    location_data.each do |location_data, team_data|
      if "#{team_name}" == "#{team_data}"
        game_hash[location][:players].each do |player_name, category|
          category.each do |category, stats|
            if category == :number
              array.push(stats)
            end
          end 
        end 
        return array      
      end 
    end 
  end
end 

def player_stats (player)
  game_hash.each do |location, location_data|
    location_data.each do |location_data, team_players|
      if location_data == :players
        team_players.each do |team_players, player_stats|
          if "#{team_players}" == "#{player}" 
            return player_stats
          end 
        end 
      end 
    end 
  end 
end 

def big_shoe_rebounds
  array = []
  game_hash.each do |location, location_data|
    location_data.each do |location_data, team_players|
      if location_data == :players
        team_players.each do |team_players, stat_category|
          stat_category.each do |stat_category, stats|
            if stat_category == :shoe
              array.push(stats)
            end 
          end 
        end 
      end 
    end
  end 
  array.sort!                                          
  biggest_shoe = array[-1]
    game_hash.each do |location, location_data|
    location_data.each do |location_data, team_players|
      if location_data == :players
        team_players.each do |team_players, stat_category|
          stat_category.each do |stat_category, stats|
            if stat_category == :shoe
              if biggest_shoe == stats
                return game_hash[location][location_data][team_players][:rebounds]
              end
            end 
          end
        end 
      end 
    end
  end 
end 