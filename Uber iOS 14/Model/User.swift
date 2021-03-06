//
//  User.swift
//  Uber iOS 14
//
//  Created by Stanley Traub on 12/31/20.
//

import CoreLocation

struct User {
    let fullname: String
    let email: String
    let accountType: Int
    let uid: String
    var location: CLLocation?
    
    init(uid: String,  dictionary: [String: Any]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}
