//
//  UserListInteractor.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation

//object
// protocol
// ref to presenter
// Contains the Business Logic for single use case & Manipulate and Retrieve entities

class UserListInteractor: userListInteractorProtocol {
    
    var presenter: UserListPresenter?
    
    func fetchUserList(completion: @escaping (_ arrUserList:[userList]) -> Void) {
        userListData.callAPIToGetUserList { arrUserList in
            completion(arrUserList)
        } faliure: { error in
            print(error)
        }

    }
    
    func getUserDetails(_ userId: String, completion: @escaping (UserData?) -> Void) {
        UserData.callAPIToGetUserData(userID: userId) { userdata in
            completion(userdata)
        } faliure: { error in
            print(error)
        }

    }
    
    
}
