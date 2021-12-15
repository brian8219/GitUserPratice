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
    
    private let downloadImageQueue = OperationQueue()
    
    var onImageDownloaded: ((UIImage?) -> Void)?
    
    init(login: String , type: String , avatarUrl: String , id : Int) {
        self.login = login
        self.type = type
        self.avatarUrl = avatarUrl
        self.id = id
    }
    
    func getImage() {
        guard let url = URL(string: avatarUrl) else { return }
        downloadImageQueue.addOperation { [weak self] in
           do {
               let data = try Data(contentsOf: url)
               let image = UIImage(data: data)
               guard let imageDownloaded = self?.onImageDownloaded else { return }
               imageDownloaded(image)
           } catch let error {
                print(error.localizedDescription)
           }
        }
    }
}

