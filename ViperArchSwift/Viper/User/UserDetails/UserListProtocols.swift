//
//  UserListProtocols.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation
import UIKit

// list of all protocols

/*
 // MARK: - View Input (View -> Presenter)
 protocol userListViewToPresenter {
     
 }

 // MARK: - View Input (Presenter -> View)
 protocol userListPresenterToView {
     
 }

 protocol userListPresenterToInteractor {
     
 }

 protocol userListInteractorToPresenter {
     
 }

 protocol UserListPresenterToRouter {
     
 }

 */

protocol userListPresenterProtocol {
    var controller: UserListVC? {get set}
    var router: UserListRouter? {get set}
    var interactor: UserListInteractor? {get set}
    
    func viewDidLoad()
    func viewWillApper()
    func setupTableView()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
//    func navigateToUserDetailScreen(_ navigationController: UINavigationController,_ userData: UserData)
    
}

protocol userListInteractorProtocol {
    var presenter: UserListPresenter? {get set}
    func fetchUserList(completion: @escaping (_ arrUserList:[userList]) -> Void)
    func getUserDetails(_ userId: String, completion: @escaping (_ userData: UserData?) -> Void)
}

protocol userListRouteProtocol {
    var presenter: UserListPresenter? {get set}
    
    func moveToUserDetailScreen(_ navigationController: UINavigationController,_ userData: UserData)
}
