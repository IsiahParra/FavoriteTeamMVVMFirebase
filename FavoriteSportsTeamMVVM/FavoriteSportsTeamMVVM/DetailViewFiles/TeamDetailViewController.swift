//
//  TeamDetailViewController.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import UIKit

class TeamDetailViewController: UIViewController {
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var teamLocationTextField: UITextField!
    @IBOutlet weak var sportTeamPlaysTextField: UITextField!
    
    var viewModel: TeamDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savedButtonTapped(_ sender: Any) {
        guard let name = teamNameTextField.text,
              let location = teamLocationTextField.text,
              let sport = sportTeamPlaysTextField.text else {
                  return
              }
        viewModel.saveTeam(sport: sport, name: name, location: location)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateUI() {
        guard let team = viewModel.team else {return}
        teamNameTextField.text = team.name
        teamLocationTextField.text = team.location
        sportTeamPlaysTextField.text = team.sport
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
