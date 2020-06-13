//
//  LeagueTableViewCell.swift
//  iFantasy
//
//  Created by Kevin Hoang on 1/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
