//
//  LikeStoreCell.swift
//  TablingCodingHomework
//
//  Created by user on 2021/12/28.
//

import UIKit

class LikeStoreCell: UITableViewCell {
    @IBOutlet weak var storeImgView: UIImageView!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var reviewLbl: UILabel!
    @IBOutlet weak var addrLbl: UILabel!
    @IBOutlet weak var isRemoteLbl: UILabel!
    @IBOutlet weak var waitingCountLbl: UILabel!
    
    var store:LikeStore?
    
    func displayLikeStore(storeParam: LikeStore){
        self.store = storeParam
        
        classLbl.text = store!.classification
        nameLbl.text = store!.restaurantName
        reviewLbl.text = "\(store!.rating) (\(getReviewCount(store!.reviewCount)))"
        addrLbl.text = store!.summaryAddress
        isRemoteLbl.text = getIsRemoteResult(store!.isRemoteWaiting, store!.isQuickBooking)
        
        if store!.isQuickBooking {
            waitingCountLbl.isHidden = true
        } else if store!.isRemoteWaiting {
            waitingCountLbl.isHidden = false
            waitingCountLbl.text = getWatingCount(store!.waitingCount)
        }
        
        // 이미지 썸네일
        let urlString = store!.thumbnail
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil){
                if(self.store!.thumbnail == urlString){
                    // image를 변경하는 작업은 UI를 변경시키는 작업이므로 main thread에서 돌려주어야 합니다.
                    DispatchQueue.main.async {
                        self.storeImgView.image = UIImage(data: data!)
                    }
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func getReviewCount(_ reviewCount: Int) -> String {
        return (reviewCount > 300) ? "300+" : String(reviewCount)
    }
    
    func getIsRemoteResult(_ isRemote: Bool, _ isQuick: Bool) -> String {
        var resultStr = ""
        
        if isRemote {
            resultStr = "원격줄서기"
        } else if isQuick {
            resultStr = "즉시예약"
        }
        
        return resultStr
    }
    
    func getWatingCount(_ watingCount: Int) -> String {
        return watingCount <= 0 ? "대기 없음" : "대기 \(watingCount)팀"
    }
}
