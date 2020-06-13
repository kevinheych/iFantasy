//
//  TeamModel.swift
//  iFantasy
//
//  Created by Kevin Hoang on 13/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import Foundation


enum Positions: Int {
    case GKP = 1
    case DEF = 2
    case MID = 3
    case FWD = 4
    
}

struct Team: Decodable {
    var picks: [PlayerElement]
}

struct PlayerElement: Decodable {
    var element: Int
    var position: Int
    var is_captain: Bool
    var is_vice_captain: Bool
    var multiplier: Int
    
}

struct Events: Decodable {
    var events:  [event]
}

struct event: Decodable {
    var id: Int
    var name: String
}



struct Bootstrap: Decodable {
    var elements: [elementDetail]
    var total_players: Int
}

struct elementDetail: Decodable {
    var first_name: String
    var id: Int
    var photo: String
    var team: Int
    var team_code: Int
    var event_points: Int
    var element_type: Int
}
