//
//  MessagesView.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation
import UIKit

class MessagesView: UITableViewController {
    var messages : Array<Message> = []
    var presenter: MessagePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        let message = messages[indexPath.row]
        
        cell.subject.text = message.subjectPreview
        cell.message.text = message.contentPreview
        cell.name.text = message.sender.firstName
        cell.photo.image = UIImage(named: "placeholder")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = messages[indexPath.row]
        presenter.presentDetail(message: message)
    }
    
    
}

extension MessagesView: MessageViewProtocol{
    
    func populateMessageList(messageList: Array<Message>) {
        messages = messageList
        tableView?.reloadData()
    }
    
}
