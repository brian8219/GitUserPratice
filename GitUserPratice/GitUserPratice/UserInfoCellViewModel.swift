//
//  UserInfoCellViewModel.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import UIKit
class UserInfoCellViewModel {
    var login: String = ""
    var type: String = ""
    var avatarUrl: String = ""
    var id : Int
    var pic : UIImage?
    
    init(login: String , type: String , avatarUrl: String , id : Int) {
        self.login = login
        self.type = type
        self.avatarUrl = avatarUrl
        self.id = id
        
    }
}

