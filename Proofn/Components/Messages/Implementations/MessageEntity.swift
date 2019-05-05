//
//  MessageEntity.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

struct Sender : Codable {
    let id:String
    let firstName: String
    let avatarPathSmall: String
    let email:String
}

struct Message:Codable {
    let id: String
    let sender: Sender
    let subjectPreview: String
    let contentPreview: String
}
