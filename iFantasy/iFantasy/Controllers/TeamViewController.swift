//
//  TeamViewController.swift
//  iFantasy
//
//  Created by Kevin Hoang on 31/5/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "playerCell"


class TeamViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource {
  
    
    
    
    var playerArray = [Player]()
    var gk = [Player]()
    var def = [Player]()
    var mid = [Player]()
    var fwd = [Player]()
    var bench = [Player]()
 
    
    lazy var teamData = [gk, def, mid, fwd, bench]
    
    var teamRequest = RequestTeam()
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
         
        
        

        loadTeam(userID: RequestStatus.entry_id, gw: 10)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadTeam(userID: RequestStatus.entry_id, gw: 10)
    }
    
    func findPlayerinData(id: Int) -> Player {
        let allPlayers = teamRequest.allPlayerData
        
        var newPlayer = Player(id: 0, firstname: "", team: 0, teamcode: 0, type: 0, photo: "")
        
        for element in allPlayers {
            if element.id == id {
             newPlayer = Player(id: element.id, firstname: element.first_name, team: element.team, teamcode: element.team_code, type: element.element_type, photo: element.photo)
             
            }
           
        }
        return newPlayer
    }
    
    
    func loadTeam(userID: Int, gw: Int) {
       
        teamRequest.getTeam(userID: userID
            , gw: gw)
        let squad = teamRequest.currentTeam
        
        var array = [Player]()
        for player in squad {
             let playerData = findPlayerinData(id: player.element)
            array.append(playerData)
        }
        playerArray = array
        
        
       var gkArray = [Player]()
        var defArray = [Player]()
        var midArray = [Player]()
        var fwdArray = [Player]()
        
        
        for player in playerArray {
            switch player.element_type {
            case 1:
                gkArray.append(player)
            case 2:
                defArray.append(player)
            case 3:
                midArray.append(player)
            case 4:
                fwdArray.append(player)
            default:
                break
            
            }
        }
        gk = gkArray
        def = defArray
        mid = midArray
        fwd = fwdArray
     
        teamData = [gk, def, mid, fwd, bench]
        
        
        print("playerArray: ", playerArray)
        print("gk ", gk)
        print("teamData: " , teamData)
    }
    

    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       let  count = teamRequest.total_gw_count
        return count
      }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        //Where elements_count is the count of all your items in that
        //Collection view...
        let cellCount = CGFloat(teamData[section].count)

        //If the cell count is zero, there is no point in calculating anything.
        if cellCount > 0 {
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let cellWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing

            //20.00 was just extra spacing I wanted to add to my cell.
            let totalCellWidth = cellWidth*cellCount + 20.00 * (cellCount-1)
            let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right

            if (totalCellWidth < contentWidth) {
                //If the number of cells that exists take up less room than the
                //collection view width... then there is an actual point to centering them.

                //Calculate the right amount of padding to center the cells.
                let padding = (contentWidth - totalCellWidth) / 2.0
                return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
            } else {
                //Pretty much if the number of cells that exist take up
                //more room than the actual collectionView width, there is no
                // point in trying to center them. So we leave the default behavior.
                return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
            }
        }
        return UIEdgeInsets.zero
    }
  
    
    // MARK: - UICollectionViewDataSource protocol
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return teamData.count
    }
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamData[section].count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TeamViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = teamData[indexPath.section][indexPath.item].first_name
    
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    
    
    
}



