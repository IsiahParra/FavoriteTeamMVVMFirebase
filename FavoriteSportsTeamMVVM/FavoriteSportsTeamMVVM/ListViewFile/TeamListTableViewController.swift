//
//  TeamListTableViewController.swift
//  FavoriteSportsTeamMVVM
//
//  Created by Isiah Parra on 6/13/22.
//

import UIKit

class TeamListTableViewController: UITableViewController {

    var viewModel: TeamListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TeamListViewModel()
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamTableViewCell else {return UITableViewCell()}
        let team = viewModel.teams[indexPath.row]
        
        cell.configureCell(with: team)

        // Configure the cell...

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
       
           
        }    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TeamDetailViewController else {return}
        if segue.identifier == "toDetailVC" {
            guard let index = tableView.indexPathForSelectedRow else {return}
            let team = viewModel.teams[index.row]
            destination.viewModel = TeamDetailViewModel(team: team)
        } else {
            destination.viewModel = TeamDetailViewModel()
        }
    }


}
