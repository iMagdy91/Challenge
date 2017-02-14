//
//  PostsViewController.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit
import MBProgressHUD

class PostsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    /* instance variables */
    var userID: String?
    private var posts: [PostViewModel]?
    
    /* private outlets */
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = userID
        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableViewAutomaticDimension
        getPosts()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Private Methods
    private func getPosts() {
        if let id = userID {
            MBProgressHUD.showAdded(to: view, animated: true)
            PostStore.getPostsForUser(userID: id, success: { [weak self](model) in
                guard let strongSelf = self else { return }
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
                strongSelf.posts = model
                strongSelf.tableView.reloadData()
            }, failure: { [weak self](error) in
                guard let strongSelf = self else { return }
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
                strongSelf.handleError(error: error)
            })

        }
        
        
    }
    
    //MARK UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Posts Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PostsTableViewCell
        if cell == nil {
            cell = PostsTableViewCell.init(style: .default, reuseIdentifier:identifier)
        }
        cell!.customizeCellWithModel(model: posts?[indexPath.row])
        
        return cell!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
