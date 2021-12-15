//
//  UserListViewModel.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import Foundation

class UserListViewModel {
    var dataAmount = 0
    var userInfoCellViewModels : [UserInfoCellViewModel] = []
    var userInfos : [UserInfo] = []
    var onRequestEnd: (() -> Void)?
    func getUserList(lastIndex: Int) {
        if lastIndex >= dataAmount {
            let address = "https://api.github.com/users?since=\(dataAmount)"
            if let url = URL(string: address) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else if let response = response as? HTTPURLResponse,let data = data {
                        print("Status code: \(response.statusCode)")
                        let decoder = JSONDecoder()
                        if let apiResponse = try? decoder.decode([UserInfo].self, from: data) {
                            self.userInfos = apiResponse
                            self.convertApiDataToViewModel(userInfos: self.userInfos)
                            if let lastId = apiResponse.last?.id {
                                self.dataAmount = lastId
                            }
                        }
                    }
                }.resume()
            } else {
                print("Invalid URL.")
            }
        }
    }
    
    private func convertApiDataToViewModel(userInfos: [UserInfo]) {
        for userInfo in userInfos {
            let userInfoCellViewModel = UserInfoCellViewModel.init(login: userInfo.login, type: userInfo.type, avatarUrl: userInfo.avatarUrl, id: userInfo.id)
            userInfoCellViewModels.append(userInfoCellViewModel)
        }
        self.userInfos = []
        onRequestEnd?()
    }
}
