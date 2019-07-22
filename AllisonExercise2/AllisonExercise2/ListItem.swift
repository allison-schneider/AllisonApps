//
//  ListItem.swift
//  AllisonExercise2
//
//  Created by Allison Schneider on 7/16/19.
//  Copyright © 2019 Allison Schneider. All rights reserved.
//

import UIKit

class ListItem: Decodable {
    
    let id: Int
    let code: String
    let description: String
    
    init(id: Int, code: String, description: String) {
        
        self.id = id
        self.code = code
        self.description = description
        
    }
    
}
