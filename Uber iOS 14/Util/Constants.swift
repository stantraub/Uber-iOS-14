//
//  Constants.swift
//  Uber iOS 14
//
//  Created by Stanley Traub on 12/31/20.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_DRIVER_LOCATIONS = DB_REF.child("driver-locations")
