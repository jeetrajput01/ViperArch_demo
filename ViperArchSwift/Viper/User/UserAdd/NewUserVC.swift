//
//  NewUserVC.swift
//  ViperArchSwift
//
//  Created by differenz53 on 12/02/24.
//

import UIKit

protocol createNewUserListProtocol: AnyObject {
    func newUser(_ userData: UserData)
}


class NewUserVC: UIViewController {

    //MARK: - IBOutlet properties
    
    @IBOutlet weak var txtFName: UITextField!
    
    @IBOutlet weak var txtLName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    //MARK: - Variable
    var presenter: NewUserPresenter?
    weak var delegate: createNewUserListProtocol?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = NewUserPresenter()
        self.presenter?.controller = self
        self.presenter?.viewDidLoad()
    }
    

    

}

//MARK: - IBAction properties
extension NewUserVC {
    
    @IBAction func btnAddNewUserAction(_ sender: UIButton) {
        
        self.presenter?.addNewUser()
    }
    
}
