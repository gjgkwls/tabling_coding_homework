//
//  HomeViewController.swift
//  TablingCodingHomework
//
//  Created by 허하진 on 2022/02/24.
//

import UIKit

protocol HomeDelegate {
    func getPersonInfo(index: Int)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var moveEventHandler: (() -> Void)?
    
    var homeData: [Person] = [
        Person(name: "허하진", age: 25, mbti: "ISFP"),
        Person(name: "김일이", age: 35, mbti: "ESFP"),
        Person(name: "최삼사", age: 23, mbti: "INFP"),
        Person(name: "박오육", age: 27, mbti: "ISTP"),
        Person(name: "이칠팔", age: 15, mbti: "ISFJ"),
        Person(name: "배고파", age: 5, mbti: "ENFP"),
        Person(name: "울랄라", age: 44, mbti: "ESFP"),
        Person(name: "물티슈", age: 23, mbti: "ISTP"),
        Person(name: "텀블러", age: 37, mbti: "ISFJ"),
        Person(name: "마우스", age: 12, mbti: "ISTP")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moveEventHandler = { [self] in
            guard let personListVC = self.storyboard?.instantiateViewController(withIdentifier: "PersonListViewController") as? PersonListViewController else {return}
            personListVC.modalPresentationStyle = .fullScreen
            personListVC.delegate = self // PersonListViewController에 있는 변수명 deleagate에 self를 넣은거임
            personListVC.homeData = self.homeData
            self.present(personListVC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func moveBtnClicked(_ sender: UIButton) {
        self.moveEventHandler!()
    }
}

extension HomeViewController: HomeDelegate {
    func getPersonInfo(index: Int) {
        dataLabel.text = "저는 \(homeData[index].age)살 \(homeData[index].mbti) \(homeData[index].name)입니다요"
    }
}
