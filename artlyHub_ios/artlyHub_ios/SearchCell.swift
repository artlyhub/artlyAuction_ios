//
//  SearchCell.swift
//  artlyHub_ios
//
//  Created by Yumin Park on 2017. 9. 23..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    var user: String? {
        didSet {
            nameLabel.text = user
        }
    }
    
    let previewImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "test_a")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(previewImageView)
        previewImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        previewImageView.layer.cornerRadius = 50 / 2
        previewImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, left: previewImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(separatorView)
        separatorView.anchor(top: nil, left: nameLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
