//
//  UserEntity.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation

struct UserData: Codable {
    var id, dateOfBirth, lastName, firstName: String?
    var phone, registerDate: String?
    var picture: String?
    var updatedDate, title: String?
    var location: Location?
    var email, gender: String?
}


struct Location: Codable {
    var timezone, state, street, city: String?
    var country: String?
}

extension UserData {
    
    static func callAPIToGetUserData(userID: String,completion: @escaping (_ userdata: UserData?) -> Void, faliure: @escaping(_ error: String) -> Void) {
        
        APIManager.makeRequest(url: "\(apiURLs.userData)\(userID)", method: .get, parameter: nil) { (response: UserData?) in
            completion(response)
        } failure: { error, code in
            faliure(error)
        }

        
    }
    
}
