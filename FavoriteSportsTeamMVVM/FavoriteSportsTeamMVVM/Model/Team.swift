//
//  Team.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import Foundation

class Team: Codable {
    var name: String
    var location: String
    let uuid: String
    var sport: String
    
    
    //dictionary representation
    var teamData: [String: AnyHashable] {
        ["name": self.name,
         "location": self.location,
         "uuid": self.uuid,
         "sport": self.sport]
    }
    //Initalizer
    init(name: String, location: String, uuid: String = UUID().uuidString, sport: String) {
        self.name = name
        self.location = location
        self.sport = sport
        self.uuid = uuid
    }
}
extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
