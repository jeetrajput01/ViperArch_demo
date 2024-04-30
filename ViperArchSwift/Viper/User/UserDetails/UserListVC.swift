//
//  UserListVC.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import UIKit

// ViewController
// protocol
// reference presenter
// Display data to the User as directed by Presenter & Sends user input back to the Presenter

class UserListVC: UIViewController {

    //MARK: - IBoutlet properties
    
    @IBOutlet weak var tblUser: UITableView!
    
    
    //MARK: - Variable
    var presenter: UserListPresenter?
    var arrUserList:[userList] = []
    
    //MARK: - Lisfe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = UserListPresenter() // Instantiate the presenter
        presenter?.controller = self
        presenter?.viewDidLoad()
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewUser(_:)))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillApper()
    }
    

    @objc func addNewUser(_ sender: UIBarButtonItem) {
        presenter?.addNewUser()
    }

}

extension UserListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrUserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        presenter?.tableView(tableView, heightForRowAt: indexPath) ?? .zero
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tableView(tableView, didSelectRowAt: indexPath)
    }
    
}
