//
//  LikeStoreModel.swift
//  TablingCodingHomework
//
//  Created by user on 2021/12/27.
//

import Foundation

protocol LikeStoreModelProtocol {
    func likeStoresRetrieved(stores:[LikeStore])
}

class LikeStoreModel {
    
    var delegate:LikeStoreModelProtocol?
    
    func getLikeStores(_ segControlVal:Int) {
        
        var urlString = "https://my-json-server.typicode.com/tabling/tabling_mobile_test"
        urlString += segControlVal == 0 ? "/save" : "/recent"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do{
                     let likeStoreService = try decoder.decode(LikeStoreList.self, from: data!)

                    DispatchQueue.main.async {
                        self.delegate?.likeStoresRetrieved(stores: likeStoreService.list)
                    }
                }
                catch {
                    print("Error parsing the json")
                }
                
            }
        }
        
        // datataskt 실행
        datatask.resume()
    }
}
