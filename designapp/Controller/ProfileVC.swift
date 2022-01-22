//
//  ProfileVC.swift
//  designapp
//
//  Created by cloud on 22/01/22.
//

import UIKit 

class ProfileVC: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var userid: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let objUtil = Utility()
        let username = objUtil.fetchUser()
        let pass = objUtil.fetchPassword()
        
        name.text = "Name -\(username ?? "")"
        email.text = "Email -\(username ?? "")@gmail.com"
        password.text = "Password -\(pass ?? "")"
        userid.text = "UserId - SNIP12\(username ?? "")"
    }
}
