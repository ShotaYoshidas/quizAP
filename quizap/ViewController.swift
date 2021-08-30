//
//  ViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    var myCollectionView:UICollectionView!
   
//    var collectionButton:UIBarButtonItem!
    var typeViewBarButton:UIBarButtonItem!
    let myView:MyView = {
        let mv = MyView()
        mv.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
        return mv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.pin.all()
        let viewWidth:CGFloat = self.view.frame.width
        let viewHeignt:CGFloat = self.view.frame.height
        let quiztextLabel = UILabel()
        quiztextLabel.frame = CGRect(x: viewWidth/2 - 90, y: viewHeignt/4, width: 180, height:50)
        quiztextLabel.text = "神話Quiz"
        self.view.addSubview(quiztextLabel)
        quiztextLabel.textColor = .white
        quiztextLabel.font = UIFont.systemFont(ofSize: 45)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let startButton = UIButton()
        startButton.addTarget(self, action: #selector(self.themeNext(_sender:)), for: UIControl.Event.touchUpInside)
        startButton.setTitle("スタート", for: UIControl.State.normal)
        self.view.addSubview(startButton)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        startButton.frame = CGRect(x: viewWidth/2 - 75, y: 470, width: 150, height: 60)
        startButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        startButton.layer.borderWidth = 0
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        startButton.layer.cornerRadius = 10
        let  descriptionButton = UIButton()
        descriptionButton.addTarget(self, action: #selector(self.HowToPlayNext(_sender:)), for: UIControl.Event.touchUpInside)
        descriptionButton.setTitle("遊び方", for: UIControl.State.normal)
        descriptionButton.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        self.view.addSubview(descriptionButton)
        descriptionButton.frame = CGRect(x: viewWidth/2 - 75, y: 630, width: 150, height: 60)
        descriptionButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        descriptionButton.layer.borderWidth = 0
        descriptionButton.layer.backgroundColor = UIColor.white.cgColor
        descriptionButton.layer.borderColor = UIColor.white.cgColor
        descriptionButton.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        descriptionButton.layer.cornerRadius = 10
        let  collectionButton = UIButton()
        collectionButton.addTarget(self, action: #selector(self.collectionNext(_sender:)), for: UIControl.Event.touchUpInside)
        collectionButton.setTitle("神コレ", for: UIControl.State.normal)
        collectionButton.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        self.view.addSubview(collectionButton)
        collectionButton.frame = CGRect(x: viewWidth/2 - 75, y: 550, width: 150, height: 60)
        collectionButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        collectionButton.layer.borderWidth = 0
        collectionButton.layer.borderColor = UIColor.white.cgColor
        collectionButton.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        collectionButton.layer.cornerRadius = 10
    }    
    @objc func themeNext(_sender: UIButton) {
        let tv = ThemeViewController()
        tv.modalPresentationStyle = .fullScreen
        tv.modalTransitionStyle = .crossDissolve
        self.present(tv, animated: true, completion: nil)
        
    }
    @objc func HowToPlayNext(_sender: UIButton) {
        let hp = HowToPlayViewController()
        hp.modalTransitionStyle = .crossDissolve
        hp.modalPresentationStyle = .fullScreen
        self.present(hp, animated: true, completion: nil)
        
    }
    @objc func collectionNext(_sender: UIButton) {
        let cv = CollectionViewController()
        cv.modalTransitionStyle = .crossDissolve
        cv.modalPresentationStyle = .fullScreen
        self.present(cv, animated: true, completion: nil)
    }

    }

class MyView: UIView {
    override func draw(_ rect:CGRect){
//    斜めグレイ
        let z = UIBezierPath()
        z.move(to: CGPoint(x: 0, y: 0))
//        1
        z.addLine(to: CGPoint(x: 0, y: rect.midY/2))
//        2
        z.addLine(to: CGPoint(x: rect.midX/2, y: rect.midY - rect.midY/4))
//        3
        z.addLine(to: CGPoint(x: rect.maxX - rect.midX/2, y: rect.midY - rect.midY/4))
//        4
        z.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
//        5
        z.addLine(to: CGPoint(x: rect.maxX, y: 0))
//      グレー
        UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1).setFill()
//      ピンク
//        UIColor(red: 0.8, green:0.2 , blue: 0.4, alpha: 1).setFill()
//      パープル1
//        UIColor(red: 0.1, green: 0, blue: 1, alpha: 0.4).setFill()
//     　あお
//        UIColor(red: 8/255, green: 39/255, blue: 82/255, alpha: 1).setFill()
        z.fill()
        z.close()
       
       let y = UIBezierPath()
        y.addArc(withCenter: CGPoint(x:rect.midX/2, y: rect.midY/2), radius:203/2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
//        y.addArc(withCenter: CGPoint(x:rect.midX/2, y: rect.midY/2), radius:203/2, startAngle: .pi * 0.5 - 0.0005, endAngle: .pi * 1.0 + 0.08009, clockwise:
        UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1).setFill()
        
//        UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).setFill()
        y.fill()
//
        let x = UIBezierPath()
        x.addArc(withCenter: CGPoint(x:rect.midX/2 + rect.midX, y: rect.midY), radius:203/2, startAngle: 0, endAngle: .pi*2, clockwise: false)
       
        UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1).setFill()
        x.fill()
        
    }
    
}


        
        
        

