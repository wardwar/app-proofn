//
//  MessagePresenter.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class MessagePresenter: MessagePresenterProtocol {
    var interactor: MessageInteractorProtocol!
    var view:  MessageViewProtocol!
    var router: MessageRouterProtocol!
    
    func showMessageList() {
        let dispatchQueue = DispatchQueue(label: "message list", qos: .background)
        dispatchQueue.async {
            let messageList = self.interactor.get()
            DispatchQueue.main.async {
                self.view.populateMessageList(messageList: messageList)
            }
        }
    }
    
    func presentDetail(message: Message) {
        router.presentDetail(message: message)
    }
    
    
}
