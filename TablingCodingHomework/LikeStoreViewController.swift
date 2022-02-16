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
        
        self.likeStoresRetrieved()
    }
    
    @IBAction func clickedSegControl(_ sender: UISegmentedControl) {
        // TODO: 오픈소스 사용하여 tab으로 구현
        switch sender.selectedSegmentIndex {
        case 0:
            segControlVal = 0
            self.likeStoresRetrieved()
        case 1:
            segControlVal = 1
            self.likeStoresRetrieved()
        default:
            self.likeStoresRetrieved()
        }
    }
    
    func likeStoresRetrieved() {
        model.getLikeStores(segControlVal) { stores in
            self.likeStores.removeAll()
            self.likeStores = stores
            self.likeStoreTableView.reloadData()
        }
    }
}

extension LikeStoreViewController: LikeStoreDelegate {
    func likeSotresCellClicked(store: LikeStore) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "ReviewController") as? ReviewController else {return}
        detailVC.modalPresentationStyle = .fullScreen

        detailVC.storeData = store
        self.present(detailVC, animated: true, completion: nil)
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
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
