//
//  Extension.swift
//  designapp
//
//  Created by cloud on 22/01/22.
//
import UIKit

extension UIViewController {
    func showAlert(message:String){
        let alertControll = UIAlertController(title: "SNIP", message: message, preferredStyle: UIAlertController.Style.alert)
        let alertOkAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default , handler: nil)
        alertControll.addAction(alertOkAction)
        self.navigationController?.present(alertControll, animated : true,completion:nil)
    }
    
    func saveUser(userName:String, password:String){
        let objUserDefault = UserDefaults.standard
        
        //save username
        objUserDefault.set(userName, forKey: "username")
        
        //save password
        objUserDefault.set(password, forKey: "password")
    }
    
    func fetchUser() -> String? {
        let objUserDefault = UserDefaults.standard
        
        //fetch username
        let username = objUserDefault.string(forKey: "username")
        return username
    }
    func fetchPassword() -> String? {
        
        let objUserDefault = UserDefaults.standard
        
        //fetch password
        let password = objUserDefault.string(forKey: "password")
        return password
    }
}
