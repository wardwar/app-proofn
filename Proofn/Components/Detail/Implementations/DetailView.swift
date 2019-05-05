//
//  DetailView.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController {
    
    var email: Email!
    
    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var messageCompose: UITextField!
    @IBOutlet weak var subjectCompose: UITextField!
    
    var presenter: DetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    @IBAction func SendMessage(_ sender: Any) {
        let compose = ComposeRequest(
            subject: subjectCompose.text!,
            content: messageCompose.text!,
            to: [email]
        )
        presenter.composeMessage(composeRequest: compose)
    }
}

extension DetailView: DetailViewProtocol{
    func populateDetail(message: DetailResponse) {
        sender.text = message.sender.firstName
        subject.text = message.subject
        content.text = message.content
        email = Email(email: message.sender.email)
    }
    
    func showComposeResult(message: DetailResponse){
        let alert = UIAlertController(title: "Send Message success?", message: message.content, preferredStyle: .alert)
        self.present(alert, animated: true)
    }
    
}
