//
//  LoginVc.swift
//  designapp
//
//  Created by cloud on 18/01/22.
//

import UIKit

class LoginVc: UIViewController {
        
        @IBOutlet weak var userTF: UITextField!
        
        @IBOutlet var passwordTF: UITextField!
        

        override func viewDidLoad() {
           
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
    @IBAction func login(_ sender: Any) {
        let user = userTF.text ?? ""
        let password = passwordTF.text ?? ""
        if(user.count > 0 && user == "avichal") && (password.count > 0 && password == "1234"){
            
            //save user detail
            saveUser(name: user, password: password)
            navigateToTabController()
            return
        }
        showAlert(message:MESSAGE.WRONG_CREDENTIAL.rawValue)
    }
    
    
    
    func navigateToTabController(){
        if let tc = tabBarController{
            self.navigationController?.pushViewController(tc, animated: true)
        }
    }
    
    
    func saveUser(name:String , password:String){
        let objUserDefault = UserDefaults.standard
        objUserDefault.set(name, forKey:"username")
        objUserDefault.set(password, forKey:"password")
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        }

    }
