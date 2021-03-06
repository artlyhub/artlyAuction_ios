//
//  MainHomeController.swift
//  artlyHub_ios
//
//  Created by Yumin Park on 2017. 9. 12..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class MainHomeController: UITabBarController, UITabBarControllerDelegate {
    /*
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.index(of: viewController)
        if index == 2 {
            /*
            let layout = UICollectionViewFlowLayout()
            let photoSelectorController = PhotoSelectorController(collectionViewLayout: layout)
            let navController = UINavigationController(rootViewController: photoSelectorController)
             */
            
            let photoSelectorController = PrevUploadController()
            let navController = UINavigationController(rootViewController: photoSelectorController)
            present(navController, animated: true, completion: nil)
            return false
        }
        return true
    }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let layout = UICollectionViewFlowLayout()
        
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let userProfileNavController = UINavigationController(rootViewController: userProfileController)
        userProfileNavController.tabBarItem.image = #imageLiteral(resourceName: "profile_selected")
        
        let communityController = CommunityController(collectionViewLayout: layout)
        let communityNavController = UINavigationController(rootViewController: communityController)
        communityNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_home")
        
        let searchController = SearchController(collectionViewLayout: layout)
        let searchNavController = UINavigationController(rootViewController: searchController)
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_search")
        
        let uploadController = PrevUploadController()
        let uploadNavController = UINavigationController(rootViewController: uploadController)
        uploadNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_create")
        
        let messageController = MessageController()
        let messageNavController = UINavigationController(rootViewController: messageController)
        messageNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_message")
        
        tabBar.tintColor = .black
        viewControllers = [communityNavController, searchNavController, uploadNavController, messageNavController, userProfileNavController]
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = selectedImage
        return navController
    }
}
