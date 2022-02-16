//
//  ReviewStarCell.swift
//  TablingCodingHomework
//
//  Created by 허하진 on 2022/02/15.
//

import UIKit

class ReviewStarCell: UITableViewCell {
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var reviewTxtView: UITextView!
    @IBOutlet weak var reviewView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI() {
        reviewView.layer.borderWidth = 2
        reviewView.layer.borderColor = UIColor(named: "gray")?.cgColor
        reviewView.layer.cornerRadius = 6
    }
    
    func setStoreData(storeParam: LikeStore){
        
        storeName.text = storeParam.restaurantName
        
        let urlString = storeParam.thumbnail
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil){
                if(storeParam.thumbnail == urlString){
                    // main thread에서 image 변경
                    DispatchQueue.main.async {
                        self.storeImageView.image = UIImage(data: data!)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
}

extension ReviewStarCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "제가 바로 PlaceHolder입니다."
            textView.textColor = UIColor.lightGray
        }
    }

}
