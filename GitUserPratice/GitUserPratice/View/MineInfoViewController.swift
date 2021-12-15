//
//  MineInfoViewController.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import UIKit
class MineInfoViewController : UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    let userDetailViewModel = UserDetailViewModel()
    
    override func viewDidLoad() {
        bindViewModel()
        userDetailViewModel.getUserDetail(user: "brian8219")
    }
    
    func bindViewModel() {
        userDetailViewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.userDetailViewModel.userDetail?.name
                self?.loginLabel.text = self?.userDetailViewModel.userDetail?.login
                self?.followersLabel.text = String(self?.userDetailViewModel.userDetail?.followers ?? 0)
                self?.followingLabel.text = String(self?.userDetailViewModel.userDetail?.following ?? 0)
                self?.emailLabel.text = self?.userDetailViewModel.userDetail?.email
            }
        }
        userDetailViewModel.onImageDownloaded = {[weak self] image in
            DispatchQueue.main.async {
                self?.avatarImage.makeRounded()
                self?.avatarImage.image = image
            }
            
        }
    }
}
