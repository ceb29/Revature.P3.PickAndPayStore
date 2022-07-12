//
//  ProductsTableViewCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/11/22.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var ratingLabel : UILabel!
    @IBOutlet weak var iconImage : UIImageView!
    
    static let identefier = "ProductsTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String, price: String, rating: String, icon: UIImage){
        titleLabel.text = title
        priceLabel.text = price
        ratingLabel.text = rating
        iconImage.image = icon
    }
    
    static func nib() -> UINib{
        return UINib(nibName: identefier, bundle: nil)
    }
    
}
