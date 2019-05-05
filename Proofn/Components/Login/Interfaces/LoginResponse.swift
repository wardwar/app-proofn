//
//  LoginResponse.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

struct CountryDialCode : Codable{
    let name:String
    let dialCode:String
    let code:String
}

struct User : Codable {
    let id:Int
    let hash: String
    let firstName: String
    let lastName: String?
    let fullName: String
    let avatarPathSmall: String
    let avatarPathMedium: String
    let avatarPathLarge: String
    let email: String
    let isVIP: Bool?
    let phoneNumber: String
    let countryDialCode : CountryDialCode
    let hasUsablePassword: Bool
    let username: String
    let status : Int
}

struct LoginResponse :Codable{
    let token: String
    let user: User
}


