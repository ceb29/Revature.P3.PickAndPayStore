//
//  WelcomeView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/16/22.
//

import UIKit

class WelcomeView: UIView {
    init() {
        super.init(frame: .zero)
        setupCorners()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCorners()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCorners()
    }

    func setupCorners() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

}
