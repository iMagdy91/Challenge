//
//  PostStore.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper


class PostStore {
   
    class func getPostsForUser(userID: String, success: @escaping([PostViewModel]) -> Void, failure: @escaping (Error) -> Void) {
        
        let path = String(format: NetworkStruct.postPath, userID)
        
        NetworkManager.performRequestWithPath(path: path, requestMethod: .get, parameters: nil, headers: nil, success: { (response) in
            let posts: Array<PostModel>? = Mapper<PostModel>().mapArray(JSONObject: response)
            var postsViewModel = [PostViewModel]()
            
            if let postsArray = posts {
                for post in postsArray {
                    let postModel = PostViewModel.init(title: post.title, body: post.body)
                    postsViewModel.append(postModel)
                }
            }
            success(postsViewModel)
            
        }) { (error) in
            failure(error)
        }
        
    }
    
}


