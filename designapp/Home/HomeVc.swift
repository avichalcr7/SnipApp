//
//  HomeVc.swift
//  designapp
//
//  Created by cloud on 18/01/22.
//

import UIKit

class HomeVc: UIViewController {
    
    var objPostList :[PostModel?] = []

    @IBOutlet weak var objTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //try to fetch data from the server
        let objNetworking = Networking()
        //call the getpost method
        objNetworking.getPostFrom(serverUrl: Server.kPost.rawValue){ objmodel in
            
            self.objPostList = objmodel ?? []
            
            //referesh the tableview 
            DispatchQueue.main.async{
                self.objTableView.reloadData()
            }
            print("asddf")
        }
        
    
        
    }

} 

extension HomeVc : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objPostList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let objMovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell
        let post = objPostList[indexPath.row]
        
        objMovieCell?.titleLabel.text = post?.title ?? ""
        return objMovieCell!
    }
    
}
