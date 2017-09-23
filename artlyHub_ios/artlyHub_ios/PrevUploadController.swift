//
//  prevUploadController.swift
//  artlyHub_ios
//
//  Created by Yumin Park on 2017. 9. 24..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class PrevUploadController: UIViewController {
    let webView: UIWebView = {
        let wv = UIWebView()
        let myUrl = URL(string: "https://www.naver.com/")
        let myRequest = URLRequest(url: myUrl!)
        wv.loadRequest(myRequest)
        return wv
    }()
    
    @objc func registerBtnPressed() {
        let _chageViewController = UploadController()
        let changeNavController = UINavigationController(rootViewController: _chageViewController)
        self.present(changeNavController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.tintColor = .black
        navigationItem.title = "신청방법"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_create"), style: .plain, target: self, action: #selector(registerBtnPressed))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        view.addSubview(webView)
        
        webView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
}
