//
//  UserListCellTableViewCell.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import UIKit

class UserListCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgProfile: UIImageView!
    
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
