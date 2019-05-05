//
//  DetailResponse.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

struct DetailResponse: Codable {
    let id: String
    let content: String
    let sender: Sender
    let subject: String
}
