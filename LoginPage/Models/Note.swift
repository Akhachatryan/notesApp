//
//  Notes.swift
//  LoginPage
//
//  Created by Ashot on 10/29/18.
//  Copyright © 2018 Ashot. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

struct Notes: Codable {
    var id: Int?
    var text : String?
    var createdAt: String?
    var updatedAt: String?
    var userId: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id, text
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case userId = "user_id"
    }
}


struct Job: Codable {
    var id: String?
    var createdAt: String?
    var title: String?
    var location: String?
    var type: String?
    var description: String?
    var howToApply: String?
    var company: String?
    var companyUrl: String?
    var companyLogo: String?
    var url: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, location, type, description, company, url
        case createdAt = "created_at"
        case howToApply = "how_to_apply"
        case companyUrl = "company_url"
        case companyLogo = "company_logo"
    }
}
