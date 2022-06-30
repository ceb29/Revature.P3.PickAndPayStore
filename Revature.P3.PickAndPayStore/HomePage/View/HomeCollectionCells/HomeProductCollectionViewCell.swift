//
//  HomeProductCollectionViewCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import UIKit

class HomeProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    
    func configure(homeProduct : HomeProduct){
        productImage.image = UIImage(named : homeProduct.image)
        productLabel.text = homeProduct.name
    }
}
