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
        if homeRecommended.image != "API"{
            recommendedImage.image = UIImage(named: homeRecommended.image)
        }
        else{
            if homeRecommended.data != nil{
                recommendedImage.image = UIImage(data: homeRecommended.data!)
            }
            else{
                recommendedImage.image = UIImage(named: homeRecommended.image)
            }
        }
        recommendedLabel.text = homeRecommended.name
    }
}
