//
//  DetailRepositoryProtocol.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

protocol DetailRepositoryProtocol {
    func detail(id:String) throws -> DetailResponse
    func compose(composeRequest:ComposeRequest) throws -> DetailResponse
}
