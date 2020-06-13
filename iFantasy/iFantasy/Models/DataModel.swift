//
//  PlayerProfileAPI.swift
//  iFantasy
//
//  Created by Kevin Hoang on 12/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import Foundation


struct DataResponse: Decodable {
    var player: user

    
}


struct user : Decodable {
    var first_name: String
    var last_name: String
    var entry: Int
}


struct Manager: Decodable {
    var id: Int
    var summary_overall_points: Int
    var summary_overall_rank: Int
    var summary_event_points: Int
    var current_event: Int
    var leagues: Leagues
    var name : String
    var last_deadline_value: Int
    var last_deadline_bank: Int
    
}

struct Leagues: Decodable {
    var classic: [Classic]?
    var h2h: [Classic]?
    
}

struct Classic: Decodable {
    var id: Int
    var name: String
    var entry_rank: Int
    var entry_last_rank: Int
}

//Add all the variables for the data from the different api endpoints


//might have to add Coding Keys

