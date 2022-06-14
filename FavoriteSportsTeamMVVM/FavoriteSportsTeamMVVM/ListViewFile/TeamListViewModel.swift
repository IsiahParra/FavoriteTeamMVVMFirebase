//
//  TeamListViewModel.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import Foundation

class TeamListViewModel {
    var storage: TeamStorage
    var teams: [Team] = []
    
    init(storage: TeamStorage = TeamStorage.sharedInstance) {
        self.storage = storage
    }
    
    
    func loadData() {
        storage.load()
        self.teams = storage.teams
    }
    
    func delete(index: Int) {
        storage.teams.remove(at: index)
        storage.update()
        self.teams = storage.teams
    }
}
