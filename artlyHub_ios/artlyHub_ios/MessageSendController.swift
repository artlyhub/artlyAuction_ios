//
//  MessageSendController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 17..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class MessageSendController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        navigationItem.title = "UserName"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
    }
}
