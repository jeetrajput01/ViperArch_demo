//
//  NewUserInteractor.swift
//  ViperArchSwift
//
//  Created by differenz53 on 12/02/24.
//

import Foundation

class NewUserInteractor: newUserInteractorProtocol {
    
    var presenter: NewUserPresenter?
    
    func addNewUser(params:[String:Any],completion: @escaping (UserData?) -> Void) {
        
        userListData.callAPIToCreateNewUser(params: params) { userData in
            completion(userData)
        } faliure: { error in
            print(error)
        }

        
    }
    
    
}
