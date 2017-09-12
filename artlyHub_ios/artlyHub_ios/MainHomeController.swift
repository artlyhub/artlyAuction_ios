//
//  MainHomeController.swift
//  artlyHub_ios
//
//  Created by Yumin Park on 2017. 9. 12..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class MainHomeController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let userProfileNavController = UINavigationController(rootViewController: userProfileController)
        userProfileNavController.tabBarItem.image = #imageLiteral(resourceName: "profile_selected")
        
        let communityController = CommunityController(collectionViewLayout: layout)
        let communityNavController = UINavigationController(rootViewController: communityController)
        communityNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_home")
        
        let searchNavController = SearchController()
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_search")
        
        let photoSelectNavController = templateNavController(selectedImage: #imageLiteral(resourceName: "ic_create"), rootViewController: PhotoSelectorController(collectionViewLayout: layout))
        
        let messageController = MessageController()
        let messageNavController = UINavigationController(rootViewController: messageController)
        messageNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_message")
        
        tabBar.tintColor = .black
        viewControllers = [communityNavController, searchNavController, photoSelectNavController, messageNavController, userProfileNavController]
        
        //modify tab bar item insets
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
