//
//  UserDefaults.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setLoggedIn(to value:Bool){
        set(value, forKey: "isLoggedIn")
        synchronize()
    }
    
    func setToken(to value:String){
        set(value, forKey: "token")
        synchronize()
    }
    
    func setUserData(user:User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            set(encoded, forKey: "user")
            synchronize()
        }
    }
    
    func getUserData() -> User?{
        
        if let user = object(forKey: "user") {
            let data = user as! Data
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(User.self, from: data)
                return user
            } catch let err {
                print("Cannot decode UserData", err)
                return nil
            }
        }else{
            return nil
        }
        
    }
    
    func isLoggedIn() -> Bool{
        return bool(forKey: "isLoggedIn")
    }
    
    func getToken() -> String? {
        let token = string(forKey: "token")
        return token
    }
}
