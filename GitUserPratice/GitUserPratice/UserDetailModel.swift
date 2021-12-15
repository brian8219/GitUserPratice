//
//  UserDetailModel.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import UIKit
struct UserDetail : Codable {
    var login : String?
    var name : String?
    var blog : String?
    var location : String?
    var email : String?
    var avatarUrl : String
    var id : Int?
    var followers : Int?
    var following : Int?
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case name = "name"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case avatarUrl = "avatar_url"
        case id = "id"
        case followers = "followers"
        case following = "following"
    }
}
