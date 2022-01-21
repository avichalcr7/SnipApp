//
//  HomeVm.swift
//  designapp
//
//  Created by cloud on 20/01/22.
//

import UIKit

class HomeVm: UIViewController {
    //Data source array for tableview
    var objPostList : [PostModel?] = []
    
    //This method will try to fetch data from server
    func getPost(completionHandler : @escaping ([PostModel])->() ) {
        //try to fetch the data from the server
        let objNetworking = Networking()
        //call the getpost method
        objNetworking.getPostFrom(serverUrl: Server.kPost.rawValue) { objmodel in
            self.objPostList = objmodel!
            completionHandler(objmodel!)
        }
    }
    
    func getPostFor(row:Int)-> PostModel? {
        if objPostList.count > 0 {
            return objPostList[row]
        }
        
        return nil
    }
    
    func getTotalPost() -> Int{
        return objPostList.count
    }
}
