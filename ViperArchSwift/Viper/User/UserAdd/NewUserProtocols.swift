//
//  NewUserProtocols.swift
//  ViperArchSwift
//
//  Created by differenz53 on 12/02/24.
//

import Foundation

protocol newUserPresenterProtocol {
    
    var controller: NewUserVC? {get set}
    var interactor: NewUserInteractor? {get set}
    
    func viewDidLoad()
    func addNewUser()
}

protocol newUserInteractorProtocol {

    var presenter: NewUserPresenter?{get set}
    
    func addNewUser(params:[String:Any],completion: @escaping (_ userdata: UserData?) -> Void)
}
