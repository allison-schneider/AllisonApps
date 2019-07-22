//
//  jsonBlob.swift
//  AllisonExercise2
//
//  Created by Allison Schneider on 7/17/19.
//  Copyright © 2019 Allison Schneider. All rights reserved.
//

import UIKit

class APIData: Decodable {
    
    let title: String
    let dollarh: String
    let dollarj: String
    let list: [ListItem]
    
    init(title: String, dollarh: String, dollarj: String, list: Array<ListItem>) {
        
        self.title = title
        self.dollarh = dollarh
        self.dollarj = dollarj
        self.list = list
        
    }
    
}
