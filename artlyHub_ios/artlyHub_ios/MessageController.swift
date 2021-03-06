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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.tintColor = .black
        navigationItem.title = "Message"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_send"), style: .plain, target: self, action: #selector(handleSend))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSend() {
        let navController = UINavigationController(rootViewController: MessageSendController())
        present(navController, animated: true, completion: nil)
    }
}
