//
//  DetailsVc.swift
//  designapp
//
//  Created by cloud on 19/01/22.
//

import UIKit

protocol SharedInformationProtocol{
    func send(data:String)
}

class DetailsVc: UIViewController {
    
    var post:PostModel?
    
    var delegate:SharedInformationProtocol?
    
    @IBOutlet weak var userIdLabel :UILabel!
    @IBOutlet weak var idLabel     :UILabel!
    @IBOutlet weak var titleLabel  :UILabel!
    @IBOutlet weak var bodyLabel   :UILabel!

    override func viewDidLoad() { 
        super.viewDidLoad()
        
        //setting the data
        userIdLabel.text = "UserID : - \(post?.userId ?? 0)"
        idLabel.text     = "PostID : - \(post?.id ?? 0)"
        titleLabel.text  = "Title : - \(post?.title ?? "")"
        bodyLabel.text   = "Body : - \(post?.body ?? "")"

    }

    @IBAction func sendDataAction(_ sender: Any) {
        delegate?.send(data: "data from details viewcontroller")
    }
}
