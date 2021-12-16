//
//  UserInfoCell.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import Foundation
import UIKit

class UserInfoCell: UITableViewCell {
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    private var userInfoCellViewModel: UserInfoCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImage.image = nil
        self.userInfoCellViewModel?.onImageDownloaded = nil
    }
    
    func setup(viewModel: UserInfoCellViewModel) {
        self.userInfoCellViewModel = viewModel
        self.loginLabel.text = viewModel.login
        self.accountTypeLabel.text = viewModel.type
        if let image = viewModel.pic {
            self.avatarImage.image = image
        } else {
            self.userInfoCellViewModel?.onImageDownloaded = { [weak self] image in
                DispatchQueue.main.async {
                    self?.avatarImage.image = image
                    self?.avatarImage.makeRounded()
                }
            }
            self.userInfoCellViewModel?.getImage()
        }
    }
    
}
