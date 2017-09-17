//
//  CommunityPostCell.swift
//  artlyHub_ios
//
//  Created by Yumin Park on 2017. 9. 17..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

protocol CommunityHearderDelegate {
    func didImagePressed()
}

class CommunityPostCell: UICollectionViewCell {
    
    var delegate: CommunityHearderDelegate?
    
    lazy var photoImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "test_a.png"))
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector(("photoBtnPressed:"))))
        //iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func photoBtnPressed(sender: UITapGestureRecognizer) {
        delegate?.didImagePressed()
    }
    
    let priceLabelView: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "300000\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "price", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let likeLabelView: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "300\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "likes", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let titleLabelView: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "title : ", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "Home", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let createrLabelView: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "creater : ", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "P.Y.M", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let descLabelView: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.text = "Smells like money"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        addSubview(titleLabelView)
        addSubview(createrLabelView)
        addSubview(descLabelView)
        addSubview(priceLabelView)
        addSubview(likeLabelView)
        
        photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 350)
        titleLabelView.anchor(top: photoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: centerXAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 15)
        createrLabelView.anchor(top: photoImageView.bottomAnchor, left: centerXAnchor, bottom: nil, right: rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 15)
        descLabelView.anchor(top: titleLabelView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 15)
        priceLabelView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: centerXAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        likeLabelView.anchor(top: nil, left: centerXAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
