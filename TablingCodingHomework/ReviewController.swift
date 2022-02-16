//
//  ReviewController.swift
//  TablingCodingHomework
//
//  Created by 허하진 on 2022/02/10.
//

import UIKit

class ReviewController: UIViewController {

    var storeData: LikeStore?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(storeData)
        
        var nibName = UINib(nibName: "ReviewRatingCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ReviewRatingCell")
        
        nibName = UINib(nibName: "ReviewStarCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ReviewStarCell")
        
        nibName = UINib(nibName: "ReviewNoticeCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ReviewNoticeCell")
    }
}


extension ReviewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewStarCell", for: indexPath) as! ReviewStarCell
            cell.setStoreData(storeParam: storeData!)
            cell.setUI()
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewNoticeCell", for: indexPath) as! ReviewNoticeCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewRatingCell", for: indexPath) as! ReviewRatingCell
            cell.setUI()
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewRatingCell", for: indexPath) as! ReviewRatingCell
            return cell
        }
    }
}
