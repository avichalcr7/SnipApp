//
//  Networking.swift
//  designapp
//
//  Created by cloud on 19/01/22.
//

import UIKit

class Networking {
    
    func getPostFrom(serverUrl:String, completionHandler: @escaping([PostModel]?)->() ){
        URLSession.shared.dataTask(with: URL(string: serverUrl)!){ (data,response, error) in
            if let _ = error{
                print("unable to fetch data")
                completionHandler(nil)
                return
            }
            
            do{
                //once we get data from the server, we try to convert the data to our structure - we called structure as model
                let objPostList = try JSONDecoder.init().decode([PostModel].self, from: data!)
                print(objPostList)
                completionHandler(objPostList)
            }catch{
                print("Exception : \(error)")
            }
        }.resume()
    }

}
