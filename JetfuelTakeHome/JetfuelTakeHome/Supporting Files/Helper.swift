//
//  Helper.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/3/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

struct Helper{
    
    static func createAlert(title: String, message: String, mainActionMessage: String, mainActionStyle: UIAlertAction.Style) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: mainActionMessage, style: mainActionStyle, handler: nil))
        return alert
    }
}
