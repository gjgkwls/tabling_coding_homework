//
//  LikeStoreViewController.swift
//  TablingCodingHomework
//
//  Created by user on 2021/12/27.
//

import UIKit
import Alamofire
import Foundation

class LikeStoreViewController: UIViewController {
    @IBOutlet weak var likeStoreTableView: UITableView!
    
    var likeStores = [LikeStore]()
    var model = LikeStoreModel()
    
    var segControlVal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likeStoreTableView.delegate = self
        likeStoreTableView.dataSource = self
        
        model.delegate = self
        model.getLikeStores(segControlVal)
    }
    
    @IBAction func clickedSegControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("저장")
            segControlVal = 1
            model.getLikeStores(segControlVal)
        case 1:
            print("최근본")
            segControlVal = 1
            model.getLikeStores(segControlVal)
        default:
            print("default")
        }
    }
    
}

extension LikeStoreViewController:LikeStoreModelProtocol {
    func likeStoresRetrieved(stores: [LikeStore]) {
        
        self.likeStores.removeAll()
        self.likeStores = stores
        likeStoreTableView.reloadData()
    }
}

extension LikeStoreViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.likeStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! LikeStoreCell
        let store = self.likeStores[indexPath.row]
        cell.displayLikeStore(storeParam: store)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
