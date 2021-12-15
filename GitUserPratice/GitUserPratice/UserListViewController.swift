//
//  ViewController.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import UIKit

class UserListViewController: UIViewController {
    
    let viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getApiData(lastIndex: 0)
    }


}

