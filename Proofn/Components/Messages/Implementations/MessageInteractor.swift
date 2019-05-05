//
//  MessageInteractor.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class MessageInteractor: MessageInteractorProtocol {
    var repository : MessagesRepositoryProtocol!

    func get() -> Array<Message> {
        var messages: Array<Message> = []
        if let messageRepository = try? repository.getList() {
            messages = messageRepository
        }
        return messages
    }
}
