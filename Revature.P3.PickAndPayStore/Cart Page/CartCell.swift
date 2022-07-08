//
//  CartCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/8/22.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLable: UILabel!
//    @IBAction func trashTap(_ sender: Any) {
//
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
