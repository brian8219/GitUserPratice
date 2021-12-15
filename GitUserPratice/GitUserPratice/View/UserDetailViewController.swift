//
//  UserDetailViewController.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import UIKit
class UserDetailViewController : UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    var login : String = ""
    
    let userDetailViewModel = UserDetailViewModel()
    
    override func viewDidLoad() {
        bindViewModel()
        userDetailViewModel.getUserDetail(user: login)
    }
    
    func bindViewModel() {
        userDetailViewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.userDetailViewModel.userDetail?.name
                self?.loginLabel.text = self?.userDetailViewModel.userDetail?.login
                self?.locationLabel.text = self?.userDetailViewModel.userDetail?.location
                self?.blogLabel.text = self?.userDetailViewModel.userDetail?.blog
            }
        }
        userDetailViewModel.onImageDownloaded = {[weak self] image in
            DispatchQueue.main.async {
                self?.avatarImage.image = image
            }

        }
    }
    
    @IBAction func backBottomPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
