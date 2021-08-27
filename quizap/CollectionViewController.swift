//
//  Collection1ViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

class CollectionViewController: UIViewController {
    var photos = ["images","images","images","images","images","images","images","images","images","images","images","images","images","images","images"]
    
    var charaname:[String] = ["ゼウス","ポセイドン","ハデス","images","images","images","images","images","images","images","images","images","images","images","images"]
    
    var characterArray:[String] = []
    var points = 1
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        cv.backgroundColor = .white
        return cv
    }()
    let collectionLabel:UILabel = {
        let cl = UILabel()
        cl.text = "コレクション"
        cl.textColor = .black
        cl.frame = CGRect(x: UIScreen.main.bounds.width/2-50, y: 20, width: 100, height: 50)
        return cl
    }()
    let rerutnButton:UIButton = {
        let rb = UIButton()
        rb.frame = CGRect(x: UIScreen.main.bounds.width/10, y: 700, width: 100, height: 50)
        rb.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rb.setTitle("戻る", for: UIControl.State.normal)
        rb.layer.borderWidth = 0
        rb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rb.addTarget(self, action: #selector(returnAction), for: UIControl.Event.touchUpInside)
        rb.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        rb.layer.cornerRadius = 10
        return rb
    }()
    let overlay:UIView = {
        let ol = UIView()
        ol.backgroundColor = .black.withAlphaComponent(0.7)
        ol.layer.borderColor = UIColor.gray.cgColor
        ol.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return ol
    }()
    //    canvas
    let canvas:UIImageView = {
        let cv = UIImageView()
        cv.backgroundColor  = .black
        cv.layer.cornerRadius = 10
        cv.layer.masksToBounds = true
        cv.layer.borderColor = UIColor.black.cgColor
        cv.layer.borderWidth = 2
        cv.frame = CGRect(x: 20, y: Int(UIScreen.main.bounds.height)/2-230, width: Int(UIScreen.main.bounds.width)-40, height: 280)
        cv.isUserInteractionEnabled = true
        return cv
    }()
    //    canvasLabel
    let canvasLabel:UILabel = {
        let cl = UILabel()
        cl.text = "説明文がはいる"
        cl.textAlignment = .center
        cl.backgroundColor = .white
        cl.textColor = .black
        cl.layer.borderColor = UIColor.black.cgColor
        cl.layer.borderWidth = 2
        cl.frame = CGRect(x: 20, y: Int(UIScreen.main.bounds.height)/2-Int(UIScreen.main.bounds.width)/2, width: Int(UIScreen.main.bounds.width)-40, height: 150)
        cl.layer.cornerRadius = 10
        cl.clipsToBounds = true
        
        cl.numberOfLines = 0
        return cl
    }()
    let closeButton:UIButton = {
        let cb = UIButton()
        cb.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        cb.setTitleColor(UIColor.black, for: UIControl.State.normal)
        cb.setTitle("✖️", for: UIControl.State.normal)
        cb.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        cb.addTarget(self, action: #selector(closeAction), for:UIControl.Event.touchUpInside)
        cb.isEnabled = true
        return cb
    }()
    @objc func returnAction(sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
    @objc func closeAction(sender: UIButton) {
        overlay.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(rerutnButton)
        view.addSubview(collectionView)
        collectionView.addSubview(collectionLabel)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        characterArray = loadCSV(filName: "character")
        print(characterArray)
        
        //                これだとギリシャ問題のみ！！
        switch firstPoint {
        case 1:
            photos = ["images2","images","images","images","images","images","images","images","images","images","images","images","images","images","images"]
            print("キャラ1")
        case 2:
            photos = ["images2","images2","images","images","images","images","images","images","images","images","images","images","images","images","images"]
            print("キャラ2")
        case 3:
            photos = ["images2","images2","images2","images","images","images","images","images","images","images","images","images","images","images","images"]
            print("キャラ3")
        default:
            photos = ["images","images","images","images","images","images","images","images","images","images","images","images","images","images","images"]
        }
    }
    func loadCSV(filName: String) -> [String] {
        //        強制アンラップ！！！！
        let csvBuldle = Bundle.main.path(forResource: filName, ofType: "csv")!
        do {
            let csvData =  try String(contentsOfFile: csvBuldle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of:"\r",with:"\n")
            characterArray = lineChange.components(separatedBy: "\n")
            characterArray.removeLast()
        } catch {
            print("エラー")
        }
        return characterArray
    }
    
//    willとのちがいは？
    override func viewDidLayoutSubviews() {
        collectionView.pin.all()
        overlay.isHidden = false
    }
    
   
}


//     UICollectionViewDataSource
extension CollectionViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return photos.count
        return photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            let cellImage = UIImage(named: photos[indexPath.row])!
            let cellText = charaname[indexPath.row]
            cell.configure(image: cellImage, text: cellText)
            return cell
        }
      return UICollectionViewCell()
    }
}
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    //    cell 選択時処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.addSubview(overlay)
        overlay.addSubview(canvas)
        overlay.addSubview(canvasLabel)
        canvas.addSubview(closeButton)
        overlay.bringSubviewToFront(closeButton)
        closeButton.pin.left()
        canvasLabel.pin.below(of: canvas).margin(5)
        canvas.image = UIImage(named: photos[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 110, height: 110)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacing section: Int) -> CGFloat {
        3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 80, left: 8, bottom: 10, right: 8)
    }
 
}
    
