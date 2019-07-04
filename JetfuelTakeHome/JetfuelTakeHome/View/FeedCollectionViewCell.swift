//
//  FeedCollectionViewCell.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import SDWebImage
import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // - MARK : CLASS VARIABLES
    static let id = "FeedCollectionViewCellID"
    
    // - MARK: UIELEMENTS
    let mediaCollectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        layout.scrollDirection = .horizontal

        return collectionView
    }()

    let campaignNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Bold", size: 19)
        return label
    }()
    
    let payPerInstallLabel: UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(red: 0, green: 0.5765, blue: 0.1882, alpha: 1.0)
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        return label
    }()
    
    let campaignIconView: UIImageView =  {
        
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        
        return iv
    }()
    

    var campaign: Campaign! {
        didSet {
            
            guard let iconUrl = URL(string: campaign?.campaign_icon_url ?? "") else { return }
            campaignIconView.sd_setImage(with: iconUrl, placeholderImage: UIImage(named: "image_placeholder"), options: [], completed: nil)
            campaignNameLabel.text = campaign.campaign_name
            payPerInstallLabel.text = "\(campaign.pay_per_install) per install"
            
        }
    }
    
    // - MARK: INITIALIZERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutCellItems()
        mediaCollectionView.dataSource = self
        mediaCollectionView.delegate = self
        mediaCollectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: MediaCollectionViewCell.id)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - MARK: CLASS METHODS
    private func layoutCellItems() {
        
        let labelStackView = UIStackView(arrangedSubviews: [campaignNameLabel, payPerInstallLabel])
        labelStackView.axis = .vertical
        labelStackView.distribution = .fill
        labelStackView.spacing = 12
        
        let topCardStackView = UIStackView(arrangedSubviews: [campaignIconView, labelStackView])
        topCardStackView.axis = .horizontal
        topCardStackView.distribution = .fill
        topCardStackView.spacing = 10
        topCardStackView.alignment = .center
        
        let mainStackView = UIStackView(arrangedSubviews: [topCardStackView, mediaCollectionView])
        mainStackView.spacing = 15
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        
        addSubview(mainStackView)
        mainStackView.fillSuperview(padding: .init(top: 15, left: 10, bottom: 0, right: 10))
    }
}
