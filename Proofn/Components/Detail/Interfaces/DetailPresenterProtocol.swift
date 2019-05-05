//
//  DetailPresenterProtocol.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

protocol DetailPresenterProtocol {
    func showDetailMessage(id:String)
    func composeMessage(composeRequest: ComposeRequest)
}
