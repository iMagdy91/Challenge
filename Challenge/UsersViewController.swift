//
//  UsersViewController.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit
import MBProgressHUD

class UsersViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    /* instance variables */
    private let rowHeight: CGFloat = 130.0
    private var users: [UserViewModel]?
    
    /* private outlets */
    @IBOutlet private weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Private Methods
    /* get users from API */
    private func getUsers() {
        MBProgressHUD.showAdded(to: view, animated: true)
        UserStore.getUsers(success: { [weak self](model) in
            guard let strongSelf = self else { return }
            
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            strongSelf.users = model
            strongSelf.tableView.reloadData()
            
        }) { [weak self](error) in
            guard let strongSelf = self else { return }
            
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            strongSelf.handleError(error: error)
            
        }
    }
    
    //MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Users Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? UsersTableViewCell
        if cell == nil {
            cell = UsersTableViewCell.init(style: .default, reuseIdentifier:identifier)
        }
        cell!.customizeCellWithModel(model: users?[indexPath.row])
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PostSegue", sender: indexPath)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "PostSegue" {
            if let postViewController = segue.destination as? PostsViewController {
                let indexPath = sender as! IndexPath
                if let id = users?[indexPath.row].id {
                    postViewController.userID = String(id)
                }
            }
        }
        
    }
    

}
