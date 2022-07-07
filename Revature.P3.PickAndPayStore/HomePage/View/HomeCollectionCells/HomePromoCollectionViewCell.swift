//
//  HomePromoCollectionViewCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import UIKit

class HomePromoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var promoImage: UIImageView!
    
    func configure(homePromo : HomePromo){
        promoImage.image = UIImage(named : homePromo.image)
    }
}
