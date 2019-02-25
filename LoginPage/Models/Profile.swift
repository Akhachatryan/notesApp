//
//  Registration.swift
//  LoginPage
//
//  Created by Ashot on 10/25/18.
//  Copyright © 2018 Ashot. All rights reserved.
//

import Foundation

struct Registration: Codable {
    
    var eMail: String?
    var number: String?
    var password: String?
    
    private enum CodingKeys: String, CodingKey {
        case number, password
        case eMail = "email"
    }
    
}
