//
//  LoginVC.swift
//  iFantasy
//
//  Created by Kevin Hoang on 29/5/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    
    let requestAuth = RequestAuth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    

    @IBAction func signinPressed(_ sender: Any) {
        if(signinBtn.titleLabel?.text == "Sign Out")
               {
                   let preferences = UserDefaults.standard
                   preferences.removeObject(forKey: "session")
                   
                   LoginToDo()
                   return
               }
               
               //change to textfield
        let username = "kevinn_h@live.com"
               //let password = passwordTF.text
               let password = "k3vinheych"
               if(username == "" || password == "")
               {
                   return
               }
               
               doLogin(username, password)
                
        performSegue(withIdentifier: "showMain", sender: self)
    }
    
    func doLogin(_ user:String, _ psw:String){
        let loginURL = URL(string: "https://users.premierleague.com/accounts/login/")!
        let loginParam = [
               "login": user,
               "password" : psw,
               "redirect_uri" : "https://fantasy.premierleague.com/a/login" ,
               "app" : "plfpl-web"
           ]
        
        requestAuth.callPostAuthenticate(url: loginURL, params: loginParam)
        requestAuth.showCookies()
        
    }
    
    func LoginToDo()
    {
        userTF.isEnabled = true
        passwordTF.isEnabled = true
        
        signinBtn.setTitle("Sign In", for: .normal)
    }
    
    func LoginDone()
    {
        userTF.isEnabled = false
        passwordTF.isEnabled = false
        
        signinBtn.setTitle("Sign Out", for: .normal)
    }
    
    
    
}
