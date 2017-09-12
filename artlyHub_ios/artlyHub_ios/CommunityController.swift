//
//  ViewController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 3..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class CommunityController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        let logoImage = UIImageView(image: #imageLiteral(resourceName: "artlyLogo"))
        logoImage.frame = CGRect(x: 0, y: 0, width: 38, height: 38)
        logoImage.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logoImage
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_create"), style: .plain, target: self, action: #selector(handleCreate))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_message"), style: .plain, target: self, action: #selector(handleMessage))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
    
    func handleMessage() {
        let _chageViewController = UINavigationController(rootViewController: MessageController())
        present(_chageViewController, animated: false, completion: nil)
    }
    
    func handleCreate() {
        let layout = UICollectionViewFlowLayout()
        let photoSelectorController = PhotoSelectorController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: photoSelectorController)
        present(navController, animated: true, completion: nil)
    }
}
