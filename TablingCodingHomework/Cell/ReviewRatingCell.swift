//
//  ReviewStarCell.swift
//  TablingCodingHomework
//
//  Created by 허하진 on 2022/02/11.
//

import UIKit

class ReviewRatingCell: UITableViewCell {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI() {
        btn1.isSelected = false
        btn1.layer.borderWidth = 0.6
        btn1.layer.borderColor = UIColor(named: "gray")?.cgColor
        btn2.isSelected = false
        btn2.layer.borderWidth = 0.6
        btn2.layer.borderColor = UIColor(named: "gray")?.cgColor
        btn3.isSelected = false
        btn3.layer.borderWidth = 0.6
        btn3.layer.borderColor = UIColor(named: "gray")?.cgColor
        btn4.isSelected = false
        btn4.layer.borderWidth = 0.6
        btn4.layer.borderColor = UIColor(named: "gray")?.cgColor
        btn5.isSelected = false
        btn5.layer.borderWidth = 0.6
        btn5.layer.borderColor = UIColor(named: "gray")?.cgColor
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        setUI()
        
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.black.cgColor
        sender.isSelected = true
    }
}
