//
//  ProductCollectionViewCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/8/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var displayImage : UIImageView!

    static let identifier = "ProductCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib.init(nibName: identifier, bundle: nil)
    }

}
