//
//  RequestManagerInfo.swift
//  iFantasy
//
//  Created by Kevin Hoang on 12/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import Foundation

struct StatusData {

   
}

class RequestStatus {
   
    var first_name = ""
    var last_name = ""
    static var entry_id = 0
    var team_name = ""
    var overall_points = 0
    var overall_rank = 0
    var gw = 0
    var gw_score = 0
    var team_value = 0
    var itb = 0
    var total_players = 0
    
    
    init() {
        getManagerInfo()
        getTotalPlayers()
    }
   
    func getManagerInfo (){
        
        guard let resourceURL = URL(string: "https://fantasy.premierleague.com/api/me/") else {fatalError()}
         
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response , error) in
            //fetched data
            guard let jsonData = data else {
                print(String(describing: error))
                return
            }
            
            //json decoder
            let decoder = JSONDecoder()
            do{
                //returns JSON data
                let dataResponse = try decoder.decode(DataResponse.self, from: jsonData)
                
                self.first_name = dataResponse.player.first_name
                self.last_name = dataResponse.player.last_name
                RequestStatus.self.entry_id = dataResponse.player.entry
                
            }catch {
                print(error)
            }
        }
        dataTask.resume()
    }
    
    
    func getProfileInfo(userID: Int) {
        guard let resourceURL = URL(string: "https://fantasy.premierleague.com/api/entry/\(userID)/") else {fatalError()}
              
             let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response , error) in
                 //fetched data
                 guard let jsonData = data else {
                     print(String(describing: error))
                     return
                 }
                 
                 //json decoder
                 let decoder = JSONDecoder()
                 do{
                     //returns JSON data
                     let dataResponse = try decoder.decode(Manager.self, from: jsonData)
                    self.team_name = dataResponse.name
                    self.overall_points = dataResponse.summary_overall_points
                    self.overall_rank = dataResponse.summary_overall_rank
                    self.gw = dataResponse.current_event
                    self.gw_score = dataResponse.summary_event_points
                    self.team_value = dataResponse.last_deadline_value
                    self.itb = dataResponse.last_deadline_bank
                    
                 }catch {
                     print(error)
                 }
             }
        dataTask.resume()
    }
    
    
       func getTotalPlayers() {
           guard let resourceURL = URL(string: "https://fantasy.premierleague.com/api/bootstrap-static/") else {fatalError()}
                 
                let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response , error) in
                    //fetched data
                    guard let jsonData = data else {
                        print(String(describing: error))
                        return
                    }
                    
                    //json decoder
                    let decoder = JSONDecoder()
                    do{
                        //returns JSON data
                        let dataResponse = try decoder.decode(Bootstrap.self, from: jsonData)
                        self.total_players = dataResponse.total_players
                       
                    }catch {
                        print(error)
                    }
                }
           dataTask.resume()
       }
       
    
    
}
