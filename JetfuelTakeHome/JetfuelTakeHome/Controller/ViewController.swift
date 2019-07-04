//
//  OfferFeedController.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: BaseUICollectionViewList {
    
    // - MARK : CLASS VARIABLES
    var campaigns = [Campaign]()
    private let refreshControl = UIRefreshControl()
    static var downloadingIndicator = UIActivityIndicatorView(style: .gray)
    
    // - MARK : VIEW CONTROLLER LIFECYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "PLUGS"
        configureUIElelemnts()
        configureNavBar()
        fetchData()
    }

    // - MARK : CLASS METHODS
    private func fetchData(){
        
        NetworkManager.shared.fetchCampaigns { (result) in
            
            switch result{
            // Show the campaigns to the user if successfully fetched from the API
            case let .success(fetchedCampaigns):
                self.campaigns = fetchedCampaigns
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.collectionView.reloadData()
                }
                
            // Show an alert to the user if the network request fails
            case .failure(_):
                
                let alert = Helper.createAlert(title: "Network Error", message: "Please check your internet connection", mainActionMessage: "Ok", mainActionStyle: .default)
                DispatchQueue.main.async { [weak self] in
                    
                    guard let self = self else { return }
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    private func configureNavBar() {
        
        let barButton = UIBarButtonItem(customView: ViewController.downloadingIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
    }
    
    /// Sets up all of the class' ui components 
    private func configureUIElelemnts(){
        
        // configure the collection view style and registering cell
        collectionView.backgroundColor = .white
        collectionView.refreshControl = refreshControl
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.id)
        
        // Add an action and title to the refresh spinner
        refreshControl.addTarget(self, action: #selector(refreshControllIsPulled(sender:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Campaigns ...")
    }
    
    /// Make a new API call when the user pulls the collection view down
    @objc func refreshControllIsPulled(sender: UIRefreshControl){
        self.fetchData()
        refreshControl.endRefreshing()
    }
}
