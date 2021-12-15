//
//  UserListViewModel.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import Foundation

class UserDetailViewModel {
    
    var onRequestEnd: (() -> Void)?
    func getUserDetail() {
            let address = "https://api.github.com/users/brian8219"
            if let url = URL(string: address) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else if let response = response as? HTTPURLResponse,let data = data {
                        print("Status code: \(response.statusCode)")
                        let decoder = JSONDecoder()
                        if let apiResponse = try? decoder.decode(UserDetail.self, from: data) {
                            print(apiResponse)
                        }
                    }
                }.resume()
            } else {
                print("Invalid URL.")
            }
        
    }
    
    private func convertApiDataToViewModel(userInfos: [UserInfo]) {
    
        onRequestEnd?()
    }
}
