//
//  DetailPresenter.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var interactor: DetailInteractorProtocol!
    var view:  DetailViewProtocol!
    var router: DetailRouterProtocol!
    
    func showDetailMessage(id:String) {
        let dispatchQueue = DispatchQueue(label: "show detail message", qos: .background)
        dispatchQueue.async {
            let response = self.interactor.get(id: id)
            DispatchQueue.main.async {
                guard let unwrapResponse = response else {return}
                self.view.populateDetail(message: unwrapResponse)
            }
        }
    }
    
    func composeMessage(composeRequest: ComposeRequest) {
        let dispatchQueue = DispatchQueue(label: "compose message", qos: .background)
        dispatchQueue.async {
            let response = self.interactor.post(composeRequest: composeRequest)
            DispatchQueue.main.async {
                guard let unwrapResponse = response else {return}
                self.view.showComposeResult(message: unwrapResponse)
            }
        }
    }
    
    
}
