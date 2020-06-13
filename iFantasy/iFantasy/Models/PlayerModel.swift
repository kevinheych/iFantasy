//
//  PlayerModel.swift
//  iFantasy
//
//  Created by Kevin Hoang on 13/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import Foundation


struct Player {
    
    let id: Int
    let element_type: Int
    let events_points: Int
    let first_name: String
    let photo: String
    let team: Int
    let team_code: Int
    
    init(id: Int, firstname: String, team: Int, teamcode: Int, type: Int, photo: String){
        self.id = id
        self.first_name = firstname
        self.team = team
        self.team_code = teamcode
        self.element_type = type
        self.photo = photo
        self.events_points = 0
    }
    
    
    
}

