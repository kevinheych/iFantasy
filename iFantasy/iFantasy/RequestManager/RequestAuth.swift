//
//  RequestAuth.swift
//  iFantasy
//
//  Created by Kevin Hoang on 29/5/20.
//  Copyright © 2020 Kevin Hoang. All rights reserved.
//

import Foundation

class RequestAuth {

    func getAuthentication(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    func callPostAuthenticate(url:URL, params:[String:Any])
    {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = getAuthentication(params: params)
        
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //might have to save session to UserDefaults to avoid re-authenticating each subsequent request
            guard let httpResponse = response else {
                print(String(describing: error))
                return
            }
            print("Response POST: ", httpResponse)
            
        }
        task.resume()
    }
    
    func showCookies() {
        
        let cookieStorage = HTTPCookieStorage.shared
        //println("policy: \(cookieStorage.cookieAcceptPolicy.rawValue)")
        
        let cookies = cookieStorage.cookies as! [HTTPCookie]
        print("Cookies.count: \(cookies.count)")
        for cookie in cookies {
            print("Cookie from storage: ", cookie.name)
        }
    }
}

