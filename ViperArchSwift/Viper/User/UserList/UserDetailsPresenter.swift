//
//  UserDetailsPresenter.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation

class UserDetailsPresenter: userDetailsPresenterProtocol {
    
    var controller: UserDetailsVC?
    
    func viewDidLoad() {
        self.setupData()
    }
    
    func viewWillAppear() {
        // do something
    }
    
    func setupData() {
        guard let controller = self.controller,let data = controller.userInfo else {
            return
        }
        
        controller.imgProfile.layer.masksToBounds = true
        controller.imgProfile.layer.cornerRadius = controller.imgProfile.frame.height / 2
        controller.imgProfile.load(url: URL(string: data.picture ?? ""))
        
        controller.lblEmail.text = "email: \(data.email ?? "")"
        controller.lblPhone.text = "phone_no: \(data.phone ?? "")"
        controller.lblGender.text = "gender: \(data.gender ?? "")"
        let city = data.location?.city ?? ""
        let state = data.location?.state ?? ""
        let country = data.location?.country ?? ""
        controller.lblLocation.text = "location: \(city), \(state), \(country)"
        controller.lblFirstName.text = "first_name: \(data.firstName ?? "")"
        controller.lblLastName.text = "last_name: \(data.lastName ?? "")"
        
    }
    
    
}
