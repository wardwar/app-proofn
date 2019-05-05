//
//  DetailInteractor.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {

    var repository : DetailRepositoryProtocol!

    func get(id: String) -> DetailResponse? {
        var response: DetailResponse? = nil
        if let detailResponse = try? repository.detail(id: id) {
            response = detailResponse
        }
        return response
    }
    
    func post(composeRequest: ComposeRequest) -> DetailResponse? {
        var response: DetailResponse? = nil
        if let detailResponse = try? repository.compose(composeRequest: composeRequest){
            response = detailResponse
        }
        return response
    }

}
