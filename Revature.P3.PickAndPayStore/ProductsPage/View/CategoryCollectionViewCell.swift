//
//  CategoryCollectionViewCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/29/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage : UIImageView!
    @IBOutlet weak var categoryLabel : UILabel!
    
    static let identefier = "CategoryCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.autoresizingMask.insert(.flexibleHeight)
        self.contentView.autoresizingMask.insert(.flexibleWidth)
    }
    
    func configure(image: UIImage, name: String){
        categoryLabel.text = name
        categoryImage.image = image
    }
    
    static func nib() -> UINib{
        return UINib(nibName: identefier, bundle: nil)
    }

}
