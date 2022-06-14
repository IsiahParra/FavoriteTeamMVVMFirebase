//
//  PersistentStore.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import Foundation
protocol TeamStorable {
    var teams: [Team] {get set}
    func save(_ team: Team)
    func update()
    func load()
}

class TeamStorage: TeamStorable {
    static let sharedInstance = TeamStorage()
    var teams: [Team] = []
    
    private var fileURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let url = documentDirectory.appendingPathComponent("favoriteteam-mvvm.json")
        return url
    }
    func save(_ team: Team) {
        guard let url = fileURL else {return}
        do{
            teams.append(team)
            let data = try JSONEncoder().encode(teams)
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    }
    
    func update() {
        guard let url = fileURL else {return}
        do {
            let data = try JSONEncoder().encode(teams)
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    }
    
    func load() {
        guard let url = fileURL else {return}
        do {
            let data = try Data(contentsOf: url)
            let location = try JSONDecoder().decode([Team].self, from: data)
            self.teams = location
        } catch let error{
            print(error)
        }
    }
    
    
}
