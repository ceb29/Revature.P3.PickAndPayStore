//
//  HomeRecommendedCollectionViewCell.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import UIKit

class HomeRecommendedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var recommendedImage: UIImageView!
    @IBOutlet weak var recommendedLabel: UILabel!
    
    func configure(homeRecommended : HomeRecommended){
        recommendedImage.image = UIImage(named : homeRecommended.image)
        recommendedLabel.text = homeRecommended.name
    }
}
