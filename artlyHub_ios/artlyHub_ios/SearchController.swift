//
//  SearchController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 12..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Enter username"
        sb.barTintColor = .gray
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(r: 230, g: 230, b: 230)
        sb.delegate = self
        return sb
    }()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchText)
        if searchText.isEmpty {
            self.userFilteredNames = self.userNames
        } else {
            userFilteredNames = self.userNames.filter { (userNames) -> Bool in
                return userNames.lowercased().contains(searchText.lowercased())
            }
        }
        self.collectionView?.reloadData()
    }
    
    var userFilteredNames : Array<String> = Array<String>()
    var userNames : Array<String> = Array<String>()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        navigationController?.navigationBar.addSubview(searchBar)
        let navBar = navigationController?.navigationBar
        searchBar.anchor(top: navBar?.topAnchor, left: navBar?.leftAnchor, bottom: navBar?.bottomAnchor, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        fetchUsers()
        collectionView?.register(SearchCell.self, forCellWithReuseIdentifier: cellId)
        
        print(userNames)
    }
    
    
    fileprivate func fetchUsers() {
        print("Fetching...")
        userNames.removeAll()
        guard let url = URL(string: "https://www.artlyhub.com/api/user/") else { return }
        //같은 name있는지 확인
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    if let json = json as? [String: Any] {
                        //print(json)
                        if let results = json["results"] as? [[String: Any]] {
                            for result in results {
                                //print(result)
                                if let name = result["username"] as? String {
                                    //print(name)
                                    self.userNames.append(name)
                                }
                            }
                        }
                    }
                } catch let jsonError {
                    print(jsonError)
                }
            }
            self.userFilteredNames = self.userNames
            self.collectionView?.reloadData()
        }
        session.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userFilteredNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        cell.user = userFilteredNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 66)
    }
}
