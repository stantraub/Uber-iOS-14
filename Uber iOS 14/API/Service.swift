//
//  Service.swift
//  Uber iOS 14
//
//  Created by Stanley Traub on 12/31/20.
//

import Firebase
import GeoFire

struct Service {
    
    static func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
    
    static func fetchDrivers(location: CLLocation, completion: @escaping(User) -> Void) {
        let geofire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
        
        REF_DRIVER_LOCATIONS.observe(.value) { snapshot in
            geofire.query(at: location, withRadius: 50).observe(.keyEntered, with: { uid, location in
                self.fetchUserData(uid: uid, completion: { user in
                    var driver = user
                    driver.location = location
                    completion(user)
                })
            })
        }
    }
}
