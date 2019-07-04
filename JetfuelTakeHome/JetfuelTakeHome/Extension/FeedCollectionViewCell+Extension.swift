//
//  FeedCollectionViewCell+Extension.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import  SDWebImage
import UIKit

extension FeedCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return campaign.medias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = mediaCollectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.id, for: indexPath) as! MediaCollectionViewCell
        
        let previewUrlString = campaign.medias[indexPath.row].cover_photo_url
        let url = URL(string: previewUrlString)
        
        if campaign.medias[indexPath.row].media_type == "video" {
            cell.playButton.layer.opacity = 1.0
        }
        
        cell.mediaPreview.sd_setImage(with: url!, placeholderImage: UIImage(named: "image_placeholder"), options: [], completed: nil)
        cell.copyLinkString = campaign.medias[indexPath.row].tracking_link
        cell.downloadLinkString = campaign.medias[indexPath.row].download_url
        cell.playButton.tag = indexPath.row
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width/2.5, height: 300)
    }
}

