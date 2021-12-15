//
//  UserListViewModel.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import Foundation
import UIKit

class UserDetailViewModel {
    var userDetail : UserDetail?
    var userAvatar : UIImage?
    var onRequestEnd: (() -> Void)?
    
    private let downloadImageQueue = OperationQueue()
    var onImageDownloaded: ((UIImage?) -> Void)?
    
    func getUserDetail(user:String) {
            let address = "https://api.github.com/users/\(user)"
            if let url = URL(string: address) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else if let response = response as? HTTPURLResponse,let data = data {
                        print("Status code: \(response.statusCode)")
                        let decoder = JSONDecoder()
                        if let apiResponse = try? decoder.decode(UserDetail.self, from: data) {
                            self.getImage(url: apiResponse.avatarUrl)
                            self.userDetail = apiResponse
                            self.onRequestEnd?()
                        }
                    }
                }.resume()
            } else {
                print("Invalid URL.")
            }
        
    }
    
    func getImage(url : String) {
        guard let url = URL(string: url) else { return }
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
