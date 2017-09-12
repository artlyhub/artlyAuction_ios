//
//  SearchController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 12..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search"
        tf.tintColor = .black
        tf.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ic_search"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        searchTextField.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        searchButton.anchor(top: searchTextField.topAnchor, left: nil, bottom: searchTextField.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    }
}
