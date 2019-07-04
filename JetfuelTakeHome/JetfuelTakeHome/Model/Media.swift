//
//  Media.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/3/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation

struct Media: Decodable {
    
    let cover_photo_url: String
    let download_url: String
    let tracking_link: String
    let media_type: String
}
