//
//  UserListViewController.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//

import UIKit

class UserListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   
    let userListViewModel = UserListViewModel()
    override func viewDidLoad() {
        initView()
        bindViewModel()
        userListViewModel.getUserList(lastIndex: 0)
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView() {
        var safeAreaHeight : CGFloat = 0
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            safeAreaHeight = window?.safeAreaInsets.top ?? 0
        }
        tableView.backgroundColor = UIColor.white
    }
    
    func bindViewModel() {
        userListViewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.userInfoCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell", for: indexPath) as? UserInfoCell {
            let listCellViewModel = userListViewModel.userInfoCellViewModels[indexPath.row]
            cell.setup(viewModel: listCellViewModel)
            userListViewModel.getUserList(lastIndex: userListViewModel.userInfoCellViewModels[indexPath.row].id)
            return cell
        }
        return UITableViewCell()
    }
    
  
}

