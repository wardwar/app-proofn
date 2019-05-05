//
//  DetailInteractorProtocol.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

protocol DetailInteractorProtocol {
    func get(id:String) -> DetailResponse?
    func post(composeRequest: ComposeRequest) -> DetailResponse?
}
