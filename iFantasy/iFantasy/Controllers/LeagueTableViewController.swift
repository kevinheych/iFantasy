//
//  LeagueTableViewController.swift
//  iFantasy
//
//  Created by Kevin Hoang on 1/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import UIKit

 private let reuseIdentifier = "leagueCell"

class LeagueTableViewController: UITableViewController {

     
    
    let Classic = ["l1","l2","l3"]
    let Global = ["g1","g2","g3"]
    lazy var leagues = [Classic, Global]
    
    override func viewDidLoad() {
        super.viewDidLoad()



    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
         
        return leagues.count
    }
    // Create a standard header that includes the returned text.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        var header: String = ""
        if section == 0 {
            header = "Classic Leagues"
        } else
        if section == 1 {
            header = "Global Leagues"
        }
        return header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return leagues[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LeagueTableViewCell
        
        
        let league = leagues[indexPath.section][indexPath.row]
        cell.leagueLabel.text = league
       

        return cell
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
