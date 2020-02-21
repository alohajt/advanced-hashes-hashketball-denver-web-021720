require 'pry'
def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
      colors: ["Turquoise", "Purple"],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
      colors: ["Black", "White"],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end

def players
  game_hash[:away][:players].concat(game_hash[:home][:players])
end

def find_player(name)
  players.find do |player|
    player[:player_name] == name
  end
end


def num_points_scored(name)
  # players.find do |player|
  #   player[:player_name] == name
  #   return player[:points]
  # end
  find_player(name)[:points]
end
  
def shoe_size(name)
  find_player(name)[:shoe]
end
 
def num_points_scored(player_search)
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == player_search
        return player[:points]
      end
    end
  end
end

# def shoe_size(name)
#   game_hash.each do |team, team_info|
#     team_info[:players].each do |player|
#       if player[:player_name] == name
#         return player[:shoe]
#       end
#     end
#   end
# end



# def team_colors(team_input)
#   if team_input.downcase == "charlotte hornets" 
#     return game_hash[:away][:colors]
#   else return game_hash[:home][:colors]
#   end
# end

def teams 
  game_hash.values
end
  
def team_colors(name)
  teams.find do |team|
    team[:team_name] == name
  end[:colors]
  # if teams[:team_name] == name
  #   return 
end

def team_names
  # game_hash.map do |team, team_info|
  #   team_info[:team_name]
  teams.map do |team| #have to iterate first
    team[:team_name]
  end
end

def player_numbers(team_name)

end
def player_numbers(team_name)
  jersey_number = []
  game_hash.each do |team, team_info|
    if team_info[:team_name] == team_name 
      team_info.each do |key, value|
        if key == :players
          value.each do |player|
          jersey_number.push(player[:number])
          end
        end
      end
    end
  end
  return jersey_number
end

def player_stats(input)
  game_hash.each do |team, team_info|
    team_info.each do |key, value|
      if key == :players
        value.each do |player|
          if input == player[:player_name]
            player.delete(:player_name) # having player name inside the hash was a bad idea!
            return player
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  number_scored = -1
  most_score_player = ''
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      while player[:points] > number_scored
        number_scored = player[:points]
        most_score_player = player[:player_name]
      end
    end
  end
  return most_score_player
end

def winning_team 
  team_one_total = 0
  team_two_total = 0
  winning_team = ''
  game_hash[:away] do |prop|
    while prop[:players][:points] != nil
      team_one_total += prop[:players][:points]
    end
  end

  game_hash[:home] do |prop|
    while prop[:players][:points] != nil
      team_two_total += prop[:players][:points]
    end
  end

  if team_one_total > team_two_total then
    return 'Charlotte Hornets'
  else 
    return 'Brooklyn Nets'
  end 

end


# def player_with_longest_name
#   name_length = 0
#   game_hash.each do |location, team|
    
#     while team[:players][:player_name].length > name_length
#       name_length = team[:players][:player_name].length
#     end
#   end
#   return name_length
# end

def player_with_longest_name
  player_name = 0
  longest_player = ''
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      while player[:player_name].length > player_name
        player_name = player[:player_name].length
        longest_player = player[:player_name]
      end
    end
  end
  return longest_player
end


def long_name_steals_a_ton?
  steal = 0
  player_name = 0
  longest_player_steal = 0
  
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      while player[:player_name].length > player_name
        player_name = player[:player_name].length
        longest_player_steal = player[:steals]
      end
    end
  end

  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      while player[:steals] > steal
        steal = player[:steals]
      end
    end
  end 
  #binding.pry
  return longest_player_steal >= steal
end 
