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
        
        let nibName = UINib(nibName: "ReviewStarCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ReviewStarCell")
        // Do any additional setup after loading the view.
    }
}


extension ReviewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewStarCell", for: indexPath) as! ReviewStarCell
        return cell
    }
}
