//
//  User.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 7..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class User: NSObject {
    var id: Int?
    var userName: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    var profile: Profile?
}

class Profile: NSObject {
    var sex: Int?
    var phone: String?
    var address: String?
    var status_msg: String?
    //var follow
    //var profile_pic
}
