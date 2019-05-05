//
//  DetailViewProtocol.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

protocol DetailViewProtocol {
    func populateDetail(message: DetailResponse)
    func showComposeResult(message: DetailResponse)
}
