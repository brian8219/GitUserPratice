import UIKit
struct UserInfo : Codable {
    var login : String
    var type : String
    var avatarUrl : String
    var id : Int
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case type = "type"
        case avatarUrl = "avatar_url"
        case id = "id"
    }
}
