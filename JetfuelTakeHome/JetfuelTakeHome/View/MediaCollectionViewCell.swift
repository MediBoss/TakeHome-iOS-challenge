//
//  MediaCollectionViewCell.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import AVKit
import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
    
    // - MARK: CLASS VARIABLES
    
    static let id = "MediaCollectionViewCellID"
    var downloadLinkString = ""
    var copyLinkString = ""
    var mediaPlayer: AVPlayer?
    var mediaPlayerLayer: AVPlayerLayer?
    // - MARK : UI ELEMENTS
    
    let mediaPreview: UIImageView = {
        
        let imageview = UIImageView()
        
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 10
        imageview.clipsToBounds = true
        imageview.layer.borderWidth = 0.2
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        return imageview
    }()
    
    let playButton: UIButton = {
        
        let button = UIButton()
        
        button.setBackgroundImage(UIImage(named: "play-button"), for: .normal)
        button.layer.opacity = 0.0
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let downloadButton: UIButton = {
        
        let button = UIButton()

        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 0.1
        button.setImage(UIImage(named: "download"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let copyLinkButton: UIButton = {
        
        let button = UIButton()

        button.clipsToBounds = true
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 0.1
        button.setImage(UIImage(named: "link"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }()
  
    // - MARK : INITIALIZERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0.9686, green: 0.9843, blue: 0.9882, alpha: 1.0)
        layoutCellElements()
        configureCellButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - MARK : CLASS METHODS
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mediaPlayerLayer?.removeFromSuperlayer()
        mediaPlayer?.pause()
    }
    /// Apply Autolayout to the ui components of each cell
    private func layoutCellElements(){
        
        let buttonStackView = CustomStackView(subviews: [copyLinkButton, downloadButton],
                                              alignment: .fill,
                                              axis: .horizontal,
                                              distribution: .fillEqually,
                                              spacing: 0)
        
        let mainStackView = CustomStackView(subviews: [mediaPreview, buttonStackView],
                                            alignment: .fill,
                                            axis: .vertical,
                                            distribution: .fill,
                                            spacing: 10)
        addSubview(mainStackView)
        addSubview(playButton)
        mainStackView.fillSuperview(padding: .init(top: 16, left: 10, bottom: 15, right: 10))
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    /// Adds target of each cell's associated buttons
    private func configureCellButtons(){
        
        copyLinkButton.addTarget(self, action: #selector(copyLinkButtonIsTapped(sender:)), for: .touchUpInside)
        downloadButton.addTarget(self, action: #selector(downloadButtonIsTapped(sender:)), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playButtonIsTapped(sender:)), for: .touchUpInside)
    }
    
    /// Copy the link of the selected media into the user's clipboard
    @objc private func copyLinkButtonIsTapped(sender: UIButton) {

        let clipboard = UIPasteboard.general
        clipboard.string = copyLinkString
        let alert = Helper.createAlert(title: "Copied!", message: "The Link has been successfully copied", mainActionMessage: "Ok", mainActionStyle: .default)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    /// Download the selected media
    @objc private func downloadButtonIsTapped(sender: UIButton) {
        
        DispatchQueue.global(qos: .background).async {
            
            do {
                guard let url = URL(string: self.downloadLinkString) else { return }
                let _ = try Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    
                    let alert = Helper.createAlert(title: "Downloaded", message: "The Media has been successfully downloaded", mainActionMessage: "Ok", mainActionStyle: .default)
                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            } catch {
                DispatchQueue.main.async {
                    
                    let alert = Helper.createAlert(title: "Download Failed", message: "The Media has been not downloaded", mainActionMessage: "Ok", mainActionStyle: .default)
                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    /// Plays the video of the media is of type `video`
    @objc private func playButtonIsTapped(sender: UIButton) {
        
        guard let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4") else { return }
        
        mediaPlayer = AVPlayer(url: url)
        mediaPlayerLayer = AVPlayerLayer(player: mediaPlayer)
        mediaPlayerLayer?.frame = self.mediaPreview.frame
        mediaPreview.layer.addSublayer(mediaPlayerLayer!)
        mediaPlayer?.play()
    }
}
