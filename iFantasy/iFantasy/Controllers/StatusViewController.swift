//
//  StatusViewController.swift
//  iFantasy
//
//  Created by Kevin Hoang on 12/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    @IBOutlet weak var gwHeaderLabel: UILabel!
    
    @IBOutlet weak var averagePtsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highestPtsLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var managerNameLabel: UILabel!
    
    @IBOutlet weak var overallPointsLabel: UILabel!
    @IBOutlet weak var overallRankingLabel: UILabel!
    @IBOutlet weak var totalPlayersLabel: UILabel!
    @IBOutlet weak var gwPointsLabel: UILabel!
    @IBOutlet weak var teamValueLabel: UILabel!
    @IBOutlet weak var itbLabel: UILabel!
    @IBOutlet weak var freeTransfersLabel: UILabel!
    @IBOutlet weak var transfersMadeLabel: UILabel!
    @IBOutlet weak var chipsLabel: UILabel!
 
    
    let request = RequestStatus()
    
    public var userID = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabels()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

       
        request.getProfileInfo(userID: RequestStatus.entry_id)
        loadLabels()
        
    }
    
    func loadLabels() {
        
        gwHeaderLabel.text = "Gameweek \(request.gw) Points"
        averagePtsLabel.text  = ""
        scoreLabel.text = "\(request.gw_score)"
        highestPtsLabel.text = ""
        teamNameLabel.text = request.team_name
        managerNameLabel.text = request.first_name + " " + request.last_name
        overallPointsLabel.text = "\(request.overall_points)"
        overallRankingLabel.text = "\(request.overall_rank)"
        totalPlayersLabel.text = "\(request.total_players)"
        gwPointsLabel.text = "\(request.gw_score)"
        teamValueLabel.text = "\(request.team_value)"
        itbLabel.text = "\(request.itb)"
        freeTransfersLabel.text = "0"
        transfersMadeLabel.text = "None"
        chipsLabel.text = "None"
        
    }
    
    
}
