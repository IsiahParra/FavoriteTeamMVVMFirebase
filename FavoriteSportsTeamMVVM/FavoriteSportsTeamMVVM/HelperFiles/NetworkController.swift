//
//  Network controller.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import Foundation
import Firebase

struct NetworkController {
let reference = Firebase.Database.database().reference()

func save(teams: [Team]) {
    let encodedTeams = teams.compactMap({[$0.uuid : $0.teamData]})
    reference.child("teams").setValue(encodedTeams)
}

func update(team: Team) {
    reference.child("team").updateChildValues([team.uuid : team.teamData])
}

}
