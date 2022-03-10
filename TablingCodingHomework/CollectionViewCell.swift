//
//  CollectionViewCell.swift
//  TablingCodingHomework
//
//  Created by 허하진 on 2022/02/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellLbl: UILabel!
    
    func setCollectionViewUI(data: Person) {
        cellLbl.text = "\(data.name)\n\(data.age)\n\(data.mbti)"
    }
}
