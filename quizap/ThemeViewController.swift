//
//  ThemeViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

class ThemeViewController: UIViewController {
    var selectTag = 0
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = false
        cv.register(TypeCollectionViewCell1.self, forCellWithReuseIdentifier: "Cell")
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
//      gameoverLabel
    let gameoverLabel:UILabel = {
        let gl = UILabel()
        gl.frame = CGRect(x: UIScreen.main.bounds.width/2 - 60, y: UIScreen.main.bounds.height/4, width: 120, height:50)
        gl.text = "テーマ"
        gl.textColor = .black
        gl.font = UIFont.systemFont(ofSize: 40)
        return gl
    }()
//      returnButton
    let returnButton:UIButton = {
        let rb = UIButton()
        rb.addTarget(self, action: #selector(returnAction), for: UIControl.Event.touchUpInside)
        rb.setTitle("戻る", for: UIControl.State.normal)
        rb.frame = CGRect(x: UIScreen.main.bounds.width/10, y: 720, width: 100, height: 50)
        rb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rb.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        rb.layer.cornerRadius = 10
        rb.layer.borderColor = UIColor.white.cgColor
        return rb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
        view.addSubview(gameoverLabel)
        view.addSubview(returnButton)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
    }
    @objc func returnAction(_sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.pin.vCenter().left().right().height(300)
    }    
}
extension ThemeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TypeCollectionViewCell1 {
            if indexPath.row == 0 {
                cell.configure(text: "ギリシャ神話")
            } else if indexPath.row == 1 {
                cell.configure(text: "北欧神話")
            } else if indexPath.row == 2 {
                cell.configure(text: "日本神話")
            }
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectTag = indexPath.row + 1
        
        if selectTag == 1 {
            print("選択したテーマ\(selectTag)")
            let sl = LevelViewController()
            sl.modalTransitionStyle = .crossDissolve
            sl.modalPresentationStyle = .fullScreen
            sl.selectTypequiz = selectTag
            self.present(sl, animated: true, completion: nil)
        } else if selectTag == 2 {
            print("選択したテーマ\(selectTag)")
            let sl = LevelViewController()
            sl.modalTransitionStyle = .crossDissolve
            sl.modalPresentationStyle = .fullScreen
            sl.selectTypequiz = selectTag
            self.present(sl, animated: true, completion: nil)
        } else if selectTag == 3 {
            print("選択したテーマ\(selectTag)")
            let sl = LevelViewController()
            sl.modalTransitionStyle = .crossDissolve
            sl.modalPresentationStyle = .fullScreen
            sl.selectTypequiz = selectTag
            self.present(sl, animated: true, completion: nil)
        }
    }
}
extension ThemeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width/2 - 100, bottom: 0, right: UIScreen.main.bounds.width/2 - 100)
    }
}
class TypeCollectionViewCell1: UICollectionViewCell {
    let label: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        label.pin.all()
    }
    
    func configure(text: String) {
        label.text = text
    }
        
    }



