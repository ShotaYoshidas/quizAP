//
//  ViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {
    
    var myCollectionView:UICollectionView!
    
    let quiztextLabel:UILabel = {
        let ql = UILabel()
        ql.frame = CGRect(x: UIScreen.main.bounds.width/2 - 90, y: UIScreen.main.bounds.height/4, width: 180, height:50)
        ql.text = "神話Quiz"
        ql.textColor = .white
        ql.font = UIFont.systemFont(ofSize: 45)
        return ql
    }()
    
    let startButton:UIButton = {
        let sb = UIButton()
        sb.addTarget(self, action: #selector(themeNext), for: UIControl.Event.touchUpInside)
        sb.setTitle("スタート", for: UIControl.State.normal)
        sb.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        sb.frame = CGRect(x: UIScreen.main.bounds.width/2 - 75, y: 470, width: 150, height: 60)
        sb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        sb.layer.borderWidth = 0
        
        sb.layer.borderColor = UIColor.white.cgColor
        sb.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        sb.layer.cornerRadius = 10
        return sb
    }()
    let descriptionButton:UIButton = {
        let db = UIButton()
        db.frame = CGRect(x: UIScreen.main.bounds.width/2 - 75, y: 630, width: 150, height: 60)
        db.setTitleColor(UIColor.white, for: UIControl.State.normal)
        db.layer.borderWidth = 0
        db.layer.backgroundColor = UIColor.white.cgColor
        db.layer.borderColor = UIColor.white.cgColor
        db.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        db.layer.cornerRadius = 10
        db.addTarget(self, action: #selector(HowToPlayNext), for: UIControl.Event.touchUpInside)
        db.setTitle("遊び方", for: UIControl.State.normal)
        db.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        return db
    }()
    let collectionButton:UIButton = {
        let cb = UIButton()
        cb.addTarget(self, action: #selector(collectionNext), for: UIControl.Event.touchUpInside)
        cb.setTitle("神コレ", for: UIControl.State.normal)
        cb.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        cb.frame = CGRect(x: UIScreen.main.bounds.width/2 - 75, y: 550, width: 150, height: 60)
        cb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        cb.layer.borderWidth = 0
        cb.layer.borderColor = UIColor.white.cgColor
        cb.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        cb.layer.cornerRadius = 10
        return cb
    }()
    let myView:MyView1 = {
        let mv = MyView1()
        mv.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
//
        return mv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.pin.all()
        view.addSubview(quiztextLabel)
        view.addSubview(startButton)
        view.addSubview(descriptionButton)
        view.addSubview(collectionButton)
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


class MyView1: UIView {
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







