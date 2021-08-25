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
        mv.backgroundColor = UIColor.white
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
        quiztextLabel.textColor = .black
        quiztextLabel.font = UIFont.systemFont(ofSize: 45)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let startButton = UIButton()
        startButton.addTarget(self, action: #selector(self.themeNext(_sender:)), for: UIControl.Event.touchUpInside)
        startButton.setTitle("スタート", for: UIControl.State.normal)
        self.view.addSubview(startButton)
        startButton.frame = CGRect(x: viewWidth/2 - 75, y: 470, width: 150, height: 60)
        startButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        startButton.layer.borderWidth = 0
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        startButton.layer.cornerRadius = 10
        let  descriptionButton = UIButton()
        descriptionButton.addTarget(self, action: #selector(self.HowToPlayNext(_sender:)), for: UIControl.Event.touchUpInside)
        descriptionButton.setTitle("遊び方", for: UIControl.State.normal)
        self.view.addSubview(descriptionButton)
        descriptionButton.frame = CGRect(x: viewWidth/2 - 75, y: 630, width: 150, height: 60)
        descriptionButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        descriptionButton.layer.borderWidth = 0
        descriptionButton.layer.backgroundColor = UIColor.white.cgColor
        descriptionButton.layer.borderColor = UIColor.white.cgColor
        descriptionButton.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        descriptionButton.layer.cornerRadius = 10
        let  collectionButton = UIButton()
        collectionButton.addTarget(self, action: #selector(self.collectionNext(_sender:)), for: UIControl.Event.touchUpInside)
        collectionButton.setTitle("図鑑", for: UIControl.State.normal)
        self.view.addSubview(collectionButton)
        collectionButton.frame = CGRect(x: viewWidth/2 - 75, y: 550, width: 150, height: 60)
        collectionButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        collectionButton.layer.borderWidth = 0
        collectionButton.layer.borderColor = UIColor.white.cgColor
        collectionButton.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
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
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY/2))
        path.addLine(to: CGPoint(x:  rect.maxX, y: rect.maxY-rect.midY/2))
        path.addLine(to: CGPoint(x:  100, y: 200))
        path.addCurve(to: CGPoint(x: 200, y: 200), controlPoint1: CGPoint(x: 150, y: 100), controlPoint2: CGPoint(x: 200, y: 150))
//        path.addLine(to: CGPoint(x:  rect.manX, y: rect.midY)
//                     path.close()
        path.lineWidth = 5
        UIColor.brown.setStroke()
        path.stroke()
    }
}


        
        
        

