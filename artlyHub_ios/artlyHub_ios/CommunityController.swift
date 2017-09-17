//
//  ViewController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 3..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class CommunityController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CommunityHearderDelegate {

    let cellId = "cellId"
    
    func didImagePressed() {
        print("Photo Clicked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(CommunityPostCell.self, forCellWithReuseIdentifier: cellId)
        
        let logoImage = UIImageView(image: #imageLiteral(resourceName: "artlyLogo"))
        logoImage.frame = CGRect(x: 0, y: 0, width: 38, height: 38)
        logoImage.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logoImage
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 450)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! CommunityPostCell
        header.delegate = self
        return header
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
