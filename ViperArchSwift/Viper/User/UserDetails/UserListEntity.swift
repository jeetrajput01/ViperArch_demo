//
//  UserListEntity.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation

// Basic Model Objects only Interactor communicates with them

struct userListData: Codable {
    var limit: Int?
    var data: [userList]?
    var total, page: Int
}

struct userList: Codable {
    var firstName, id, title, lastName: String?
    var picture: String?
}


extension userListData {
    
    static func callAPIToGetUserList(completion: @escaping(_ arrUserList:[userList]) -> Void, faliure: @escaping(_ error: String) -> Void) {
        
        APIManager.makeRequest(url: apiURLs.userList, method: .get, parameter: nil) { (response: userListData) in
            guard let responseData = response.data else {
                return
            }
            completion(responseData)
            
        } failure: { error, code in
            print(error)
        }

    }
    
    static func callAPIToCreateNewUser(params:[String:Any],completion: @escaping(_ userData: UserData?) -> Void, faliure: @escaping(_ error: String) -> Void) {
        // ["firstName":firstName,"lastName":lastName,"email":email]
        let firstName = params["firstName"] as? String ?? ""
        let lastName = params["lastName"] as? String ?? ""
        let email = params["email"] as? String ?? ""
        let url = apiURLs.addUser + "/firstName=\(firstName)"
        APIManager.makeRequest(url: apiURLs.addUser, method: .post, parameter: params) { (response: UserData?) in
            completion(response)
        } failure: { error, code in
            print(error)
        }

        
    }
    
}
