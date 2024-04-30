//
//  UserDetailsVC.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import UIKit

class UserDetailsVC: UIViewController {

    //MARK: - IBOuetlet properties
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    //MARK: - variable
    var userInfo: UserData?
    var presenter: UserDetailsPresenter?
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = UserDetailsPresenter()
        self.presenter?.controller = self
        self.presenter?.viewDidLoad()
        
        
    }

    
    
    
}
