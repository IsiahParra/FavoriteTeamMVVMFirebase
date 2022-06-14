//
//  TeamDetailViewModel.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import Foundation

class TeamDetailViewModel {
var team: Team?
    let storage: TeamStorage
    
    init(team: Team? = nil, storage: TeamStorage = TeamStorage.sharedInstance) {
        self.team = team
        self.storage = storage
    }

func saveTeam(sport: String, name: String, location: String) {
    if team != nil {
        updateTeam(sport: sport, name: name, location: location)
    } else {
        team = Team(name: name, location: location, sport: sport)
        NetworkController().update(team: team!)
    }
    
    func updateTeam(sport: String, name: String, location: String) {
        if let team = team {
            team.sport = sport
            team.name = name
            team.location = location
        } else {
            team = Team(name: name, location: location, sport: sport)
        }
        NetworkController().update(team: team!)
        }
    }
}
