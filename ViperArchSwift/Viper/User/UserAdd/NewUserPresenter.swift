//
//  NewUserPresenter.swift
//  ViperArchSwift
//
//  Created by differenz53 on 12/02/24.
//

import Foundation

class NewUserPresenter: newUserPresenterProtocol {
    var controller: NewUserVC?
    
    var interactor: NewUserInteractor?
    
    func viewDidLoad() {
        
        self.interactor = NewUserInteractor()
        self.interactor?.presenter = self
        
    }
    
    func addNewUser() {
        let firstName = self.controller?.txtFName.text ?? ""
        let lastName = self.controller?.txtLName.text ?? ""
        let email = self.controller?.txtEmail.text ?? ""
//        let params:[String:Any] = ["firstName":firstName,"lastName":lastName,"email":email]
        self.controller?.dismiss(animated: true, completion: {
            let userData = UserData(id: UUID().uuidString, dateOfBirth: "", lastName: lastName, firstName: firstName, phone: "", registerDate: "", picture: "", updatedDate: "", title: "mr", location: nil, email: email, gender: "Male")
            if let del = self.controller?.delegate {
                del.newUser(userData)
            }
        })

    }
    
    
}
