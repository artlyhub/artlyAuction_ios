//
//  EditProfileController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 27..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class EditProfileController: UIViewController {
    let modifyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("수정하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 150, g: 150, b: 150), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor(r: 150, g: 150, b: 150).cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(modifyBtnPressed), for: .touchUpInside)
        return button
    }()
    
    func modifyBtnPressed(sender : UIButton) {
        let parameters = ["sex": sexTextField.text, "profile_pic": nil, "phone": phoneTextField.text, "address": addressTextField.text, "status_msg": statusMsgTextField.text, "follow": ""]
        guard let url = URL(string: "https://www.artlyhub.com/api/user-profile/whateveruwant/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return }
        request.httpBody = httpBody
        
        let sessionRegister = URLSession.shared
        sessionRegister.dataTask(with: request) {
            (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }

    let sexTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "sex"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let profilePicTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "profilePic"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "phone"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let addressTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "address"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let statusMsgTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "msg"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let followTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "follow"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBackSpace))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        view.addSubview(modifyButton)
        view.addSubview(sexTextField)
        view.addSubview(phoneTextField)
        view.addSubview(addressTextField)
        view.addSubview(statusMsgTextField)
        modifyButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        sexTextField.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 55, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        phoneTextField.anchor(top: sexTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        addressTextField.anchor(top: phoneTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        statusMsgTextField.anchor(top: addressTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
    
    func handleBackSpace(){
        dismiss(animated: true, completion: nil) //이전의 화면으로 돌아가기
    }

}
