//
//  Campaign.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation


struct Campaign: Decodable{
    
    let campaign_name: String
    let campaign_icon_url: String
    let pay_per_install: String
    let medias: [Media]
}

struct Campaigns: Decodable {
    let campaigns: [Campaign]
}
