//
//  RequestTeam.swift
//  iFantasy
//
//  Created by Kevin Hoang on 13/6/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import Foundation


class RequestTeam {
    
    var currentTeam = [PlayerElement]()
    var allPlayerData = [elementDetail]()
    var total_gw_count = 38
    
    init() {
        getTotalGWCount()
        getAllPlayers()
    }

    func getTeam(userID: Int, gw: Int) {
        
              guard let resourceURL = URL(string: "https://fantasy.premierleague.com/api/entry/\(userID)/event/\(gw)/picks/") else {fatalError()}
        
         
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
                let dataResponse = try decoder.decode(Team.self, from: jsonData)
                self.currentTeam = dataResponse.picks
                
            }catch {
                print(error)
            }
        }
        dataTask.resume()
          
        
    }
    
    func getTotalGWCount() {
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
                let dataResponse = try decoder.decode(Events.self, from: jsonData)
                self.total_gw_count = dataResponse.events.count
                
            }catch {
                print(error)
            }
        }
        dataTask.resume()
    }
    
    func getAllPlayers() {
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
                self.allPlayerData = dataResponse.elements
                
                  
              }catch {
                  print(error)
              }
          }
          dataTask.resume()
      }
    
     
    
}
