//
//  CustomStackView.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/3/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class CustomStackView: UIStackView{
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    convenience init (subviews: [UIView], alignment: UIStackView.Alignment, axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat){
        
        self.init(arrangedSubviews: subviews)
        self.alignment = alignment
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        translatesAutoresizingMaskIntoConstraints = false
    }
}
