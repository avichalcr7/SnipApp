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
        
        //setting title label 
        objMovieCell?.titleLabel.text = post?.title ?? ""
        
        //setting body label
        objMovieCell?.bodyLabel.text = post?.body ?? ""
        return objMovieCell!
    }
    
}

extension HomeVc : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath.row)
        
        //navigate to next screen
        
        let objDetailsVc = self.storyboard?.instantiateViewController(identifier: "DetailsVc") as? DetailsVc
        
        let post = objPostList[indexPath.row]
        
        if let objDetailsVc = objDetailsVc{
            objDetailsVc.post = post
            self.navigationController?.pushViewController(objDetailsVc, animated: true)
        }
    }
}
