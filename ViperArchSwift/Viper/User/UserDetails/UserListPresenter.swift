//
//  UserListPresenter.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation
import UIKit

//Object
//protocol
// ref to interactor, router, view
// Contains the View Logic to prepare the content for display & Request new data from Interactor according to the User Action

class UserListPresenter: userListPresenterProtocol {
  
    var controller: UserListVC?
    
    var router: UserListRouter?
    
    var interactor: UserListInteractor?
    
    
    
    func viewDidLoad() {
       
        self.interactor = UserListInteractor()
        self.router = UserListRouter()
        self.interactor?.presenter = self
        self.router?.presenter = self
        self.getUserList()
        self.setupTableView()
    }
    
    func viewWillApper() {
        // do something
    }
    
    func setupTableView() {
        
        self.controller?.tblUser.register(UINib(nibName: "UserListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListCellTableViewCell")
        
    }
    
    func addNewUser() {
        
    
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewUserVC") as? NewUserVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            vc.delegate = self
            self.controller?.present(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCellTableViewCell", for: indexPath) as? UserListCellTableViewCell else {
            return UITableViewCell()
        }
        let data = self.controller?.arrUserList[indexPath.row]
        let title = data?.title ?? ""
        let firstName = data?.firstName ?? ""
        let lastName = data?.lastName ?? ""
        cell.lblName.text = title + "," + firstName + " " + lastName
        cell.imgProfile.layer.masksToBounds = true
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.height / 2
        cell.imgProfile.load(url: URL(string: data?.picture ?? ""))

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userData = self.controller?.arrUserList[indexPath.row]
        self.getUserDetails(userID: userData?.id ?? "")
    }
    
    func getUserList() {
        self.interactor?.fetchUserList(completion: { userList in
            
            DispatchQueue.main.async {
                self.controller?.arrUserList = userList
                self.controller?.tblUser.reloadData()
            }
            
        })
    }
    
    func getUserDetails(userID: String) {
        
        self.interactor?.getUserDetails(userID, completion: { data in
            
            DispatchQueue.main.async {
                
                guard let userdata = data, let navControlller = self.controller?.navigationController else {
                    return
                }
                
                self.router?.moveToUserDetailScreen(navControlller, userdata)
                
            }
           
            
        })
        
    }
    
}

extension UserListPresenter: createNewUserListProtocol {
    
    func newUser(_ userData: UserData) {
        let userList = userList(firstName: userData.firstName, id: userData.id, title: userData.title, lastName: userData.lastName, picture: "")
        self.controller?.arrUserList.insert(userList, at: 0)
        self.controller?.tblUser.reloadData()
    }
    
}

extension UIImageView {
    func load(url: URL?) {
        DispatchQueue.global().async { [weak self] in
            if let url = url,let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.image = UIImage(named: "currentTeamLogo")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = UIImage(named: "currentTeamLogo")
                }
            }
        }
    }
}
