//
//  ReviewStarCell.swift
//  TablingCodingHomework
//
//  Created by 허하진 on 2022/02/11.
//

import UIKit

class ReviewStarCell: UITableViewCell {

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
    
    override func prepareForReuse() {
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        btn1.isSelected = false
        btn1.layer.borderWidth = 0
        btn2.isSelected = false
        btn2.layer.borderWidth = 0
        btn3.isSelected = false
        btn3.layer.borderWidth = 0
        btn4.isSelected = false
        btn4.layer.borderWidth = 0
        btn5.isSelected = false
        btn5.layer.borderWidth = 0
        
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.black.cgColor
        sender.isSelected = true
    }
}
