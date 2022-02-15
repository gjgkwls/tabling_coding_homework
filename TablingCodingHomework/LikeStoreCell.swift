//
//  LikeStoreCell.swift
//  TablingCodingHomework
//
//  Created by user on 2021/12/28.
//

import UIKit

protocol LikeStoreDelegate {
    func likeSotresCellClicked(store: LikeStore)
}

class LikeStoreCell: UITableViewCell {
    @IBOutlet weak var storeImgView: UIImageView!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var reviewLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var waitingCountLbl: UILabel!
    @IBOutlet weak var isRemoteLbl: UILabel!
    
    var store:LikeStore?
    var delegate: LikeStoreDelegate?
    
    func displayLikeStore(storeParam: LikeStore){
        self.store = storeParam
        
        classLbl.text = store!.classification
        nameLbl.text = store!.restaurantName
        reviewLbl.text = "\(store!.rating) (\(getReviewCount(store!.reviewCount)))"
        addressLbl.text = store!.summaryAddress
        isRemoteLbl.text =  getIsRemoteResult(store!.isRemoteWaiting, store!.isQuickBooking)
        
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
                    // main thread에서 image 변경
                    DispatchQueue.main.async {
                        self.storeImgView.image = UIImage(data: data!)
                    }
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    @IBAction func clickedBtn(_ sender: UIButton) {
        self.delegate?.likeSotresCellClicked(store: self.store!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override func prepareForReuse() {
        // cell 이미지 재사용시 문제 해결
        storeImgView.image = nil
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
