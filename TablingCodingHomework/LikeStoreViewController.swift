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
    @IBOutlet weak var segControl: UISegmentedControl!
    
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
        // TODO: 오픈소스 사용하여 tab으로 구현
        switch sender.selectedSegmentIndex {
        case 0:
            segControlVal = 0
            model.getLikeStores(segControlVal)
        case 1:
            segControlVal = 1
            model.getLikeStores(segControlVal)
        default:
            model.getLikeStores(segControlVal)
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
        let store = self.likeStores[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! LikeStoreCell
        cell.displayLikeStore(storeParam: store)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell 선택시
    }
}
