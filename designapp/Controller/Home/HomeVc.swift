//
//  HomeVc.swift
//  designapp
//
//  Created by cloud on 18/01/22.
//

import UIKit

class HomeVc: UIViewController, SharedInformationProtocol {
    
    
    
    var objPostList : [PostModel?] = []

    @IBOutlet weak var objTableView: UITableView!
    
    var viewModel = HomeVm()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPost { objmodel in
            self.objPostList = objmodel
            
            //referesh the tableview 
            DispatchQueue.main.async{
                self.objTableView.reloadData()
            }
            print("asddf")
        }
    }
    func send(data: String) {
        print(data)
    }
}

extension HomeVc : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalPost()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let objMovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell
        let post = indexPath.row
        
        objMovieCell!.setData(row:post, viewModel:viewModel)
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
            objDetailsVc.delegate = self
            self.navigationController?.pushViewController(objDetailsVc, animated: true)
        }
    }
}
