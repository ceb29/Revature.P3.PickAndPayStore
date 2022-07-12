//
//  SecondTabCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Mihir Ghosh on 7/11/22.
//

import UIKit

class SecondTabCell: UITableViewCell {

    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var selection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
