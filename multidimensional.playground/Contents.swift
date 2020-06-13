import UIKit



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



var multi = [
    [Player(id: 411, element_type: 1, events_points: 0, first_name: "Rui Pedro", type: <#Int#>, photo: "38533.jpg", team: 20, team_code: 39), Player(id: 47, element_type: 1, events_points: 0, first_name: "Mathew", type: <#Int#>, photo: "131897.jpg", team: 4, team_code: 36)],
[Player(id: 141, element_type: 2, events_points: 0, first_name: "Lucas", photo: "101188.jpg", team: 8, team_code: 11), Player(id: 297, element_type: 2, events_points: 0, first_name: "John", photo: "153723.jpg", team: 15, team_code: 49), Player(id: 65, element_type: 2, events_points: 0, first_name: "Diego", photo: "171129.jpg", team: 3, team_code: 91), Player(id: 208, element_type: 2, events_points: 0, first_name: "Nicolás", photo: "57410.jpg", team: 11, team_code: 43), Player(id: 185, element_type: 2, events_points: 0, first_name: "Joel", photo: "60914.jpg", team: 10, team_code: 14)],
[Player(id: 287, element_type: 3, events_points: 0, first_name: "Todd", photo: "193111.jpg", team: 14, team_code: 45), Player(id: 463, element_type: 3, events_points: 0, first_name: "Mason", photo: "184341.jpg", team: 6, team_code: 8), Player(id: 214, element_type: 3, events_points: 0, first_name: "Raheem", photo: "103955.jpg", team: 11, team_code: 43), Player(id: 488, element_type: 3, events_points: 0, first_name: "Nicolas", photo: "195735.jpg", team: 1, team_code: 3), Player(id: 215, element_type: 3, events_points: 0, first_name: "Kevin", photo: "61366.jpg", team: 11, team_code: 43)],
[Player(id: 166, element_type: 4, events_points: 0, first_name: "Jamie", photo: "101668.jpg", team: 9, team_code: 13), Player(id: 460, element_type: 4, events_points: 0, first_name: "Tammy", photo: "173879.jpg", team: 6, team_code: 8), Player(id: 234, element_type: 4, events_points: 0, first_name: "Mason", photo: "220688.jpg", team: 12, team_code: 1)], []]

multi[1][1]
