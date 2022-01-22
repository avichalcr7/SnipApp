//
//  Utility.swift
//  designapp
//
//  Created by cloud on 22/01/22.
//
import UIKit
class Utility{
    static let shared = Utility()

        

        init(){}

        

        let objUserDefault = UserDefaults.standard

        func fetchUser() -> String? {

            //fetch username
            let username = objUserDefault.string(forKey: "username")

            return username

        }
    
    func fetchPassword() -> String? {

         //fetch username
         let password = objUserDefault.string(forKey:"password")

         return password

     }
    
}
