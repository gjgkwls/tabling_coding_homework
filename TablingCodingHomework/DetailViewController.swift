//
//  DetailViewController.swift
//  TablingCodingHomework
//
//  Created by 허하진 on 2022/02/03.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var storeName: UILabel!
    var storeData: LikeStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(storeData!)
        storeName.text = storeData?.restaurantName

        // Do any additional setup after loading the view.
    }
    
}
