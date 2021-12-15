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
        super.viewDidLoad()
        bindViewModel()
        userListViewModel.getUserList(lastIndex: 0)
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let login = sender as? String, let controller = segue.destination as? UserDetailViewController else {
            return
        }
        controller.login = login
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "UserDetailView", sender: userListViewModel.userInfoCellViewModels[indexPath.row].login)
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
}

