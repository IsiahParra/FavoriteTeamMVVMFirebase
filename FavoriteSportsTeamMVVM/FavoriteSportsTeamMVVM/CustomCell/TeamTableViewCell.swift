//
//  TeamTableViewCell.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var sportPlayedLabel: UILabel!
    
    func configureCell(with team: Team) {
        teamNameLabel.text = team.name
        sportPlayedLabel.text = team.sport
    }

}
