//
//  UserDetailsProtocols.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation

//protocol userDetailsViewToPresenter {
//    
//}
//
//protocol userDetailsPresenterToView {
//    
//}
//
//protocol userDetailsPresenterToInteractor {
//    
//}
//
//protocol userLDetailsnteractorToPresenter {
//    
//}
//
//protocol UserDetailsPresenterToRouter {
//    
//}


protocol userDetailsPresenterProtocol {
    
    var controller: UserDetailsVC?{get set}
    
    func viewDidLoad()
    func viewWillAppear()
    func setupData()
    
}
