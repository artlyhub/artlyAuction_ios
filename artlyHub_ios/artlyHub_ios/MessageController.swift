//
//  MessageController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 17..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class MessageController:  UIViewController {
    
    let tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ic_send").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return button
    }()
    
    func handleSend() {
        let navController = UINavigationController(rootViewController: MessageSendController())
        present(navController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.tintColor = .black
        navigationItem.title = "Message"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        view.addSubview(tableView)
        view.addSubview(sendButton)
        sendButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 70)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
    }
}
