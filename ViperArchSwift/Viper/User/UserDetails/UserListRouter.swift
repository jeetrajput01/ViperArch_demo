//
//  UserListRouter.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation
import UIKit

// Responsible for Navigation Logic

class UserListRouter: userListRouteProtocol {
   
    var presenter: UserListPresenter?
    
    func moveToUserDetailScreen(_ navigationController: UINavigationController, _ userData: UserData) {
        
        DispatchQueue.main.async {
            
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsVC") as? UserDetailsVC {
                vc.userInfo = userData
                navigationController.pushViewController(vc, animated: true)
            }
            
        }
        
    }
    
    
}
