//
//  ComposeRequest.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

struct Email:Codable{
    let email:String
}

struct ComposeRequest:Codable {
    let subject: String
    let content: String
    let to: Array<Email>
}
