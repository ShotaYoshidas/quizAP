//
//  LevelViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

class LevelViewController: UIViewController {
    var LavelB:UIButton!
    var Lave2B:UIButton!
    var Lave3B:UIButton!
    
    var selectTag = 0
    var selecttype = 0
    var selectTypequiz = 0
    
    let myView:MyView3 = {
        let mv = MyView3()
        mv.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
        return mv
    }()
    
    let LabelSelectLabel: UILabel = {
        let l = UILabel()
        l.frame = CGRect(x: UIScreen.main.bounds.width/2 - 50, y: UIScreen.main.bounds.height/4, width: 100, height:50)
        l.textColor = .white
        l.textAlignment = .center
        l.text = "難易度"
        l.font = UIFont.systemFont(ofSize: 35)
        return l
    }()
    
    let label1:UIButton = {
        let l1 = UIButton()
        l1.addTarget(self, action: #selector(nextButton1(_sender:)), for: UIControl.Event.touchUpInside)
        
        l1.frame = CGRect(x: UIScreen.main.bounds.width/2 - 60, y: 320, width: 120, height: 50)
        l1.setTitleColor(UIColor.white, for: UIControl.State.normal)
        l1.layer.borderWidth = 0
        l1.layer.borderColor = UIColor.white.cgColor
        l1.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        l1.layer.cornerRadius = 10
        l1.setTitle("初級", for: UIControl.State.normal)
        
        return l1
        
    }()
    let label2:UIButton = {
        let l2 = UIButton()
        l2.addTarget(self, action: #selector(nextButton2(_sender:)), for: UIControl.Event.touchUpInside)
        l2.frame = CGRect(x: UIScreen.main.bounds.width/2 - 60, y: 420, width: 120, height: 50)
        l2.setTitleColor(UIColor.white, for: UIControl.State.normal)
        l2.layer.borderWidth = 0
        l2.layer.borderColor = UIColor.white.cgColor
        l2.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        l2.layer.cornerRadius = 10
        return l2
    }()
    
    let label3:UIButton = {
        let l3 = UIButton()
        l3.addTarget(self, action: #selector(nextButton3(_sender:)), for: UIControl.Event.touchUpInside)
        
        l3.frame = CGRect(x: UIScreen.main.bounds.width/2 - 60, y: 520, width: 120, height: 50)
        l3.setTitleColor(UIColor.white, for: UIControl.State.normal)
        l3.layer.borderWidth = 0
        l3.layer.borderColor = UIColor.white.cgColor
        l3.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        l3.layer.cornerRadius = 10
        return l3
    }()
    let returnButton:UIButton = {
        let rb = UIButton()
        rb.addTarget(self, action: #selector(returnAction(_sender:)), for: UIControl.Event.touchUpInside)
        rb.setTitle("戻る", for: UIControl.State.normal)
        rb.frame = CGRect(x: UIScreen.main.bounds.width/10, y: 720, width: 100, height: 50)
        rb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rb.layer.borderWidth = 0
        rb.layer.borderColor = UIColor.white.cgColor
        rb.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        rb.layer.cornerRadius = 10
        return rb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.pin.all()
        view.addSubview(LabelSelectLabel)
        view.addSubview(returnButton)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        
        label2.isEnabled = false
        
        label2.setTitle("ロック", for: UIControl.State.normal)
        label3.isEnabled = false
        
        label3.setTitle("ロック", for: UIControl.State.normal)
        
        print("現在のポイント\(firstPoint)")
        print("現在のkeyポイント\(keyValu)")
        print("テーマは\(selectTypequiz)")
        
        if  selectTypequiz == 1 && firstPoint >= 1  {
            label2.isEnabled = true
            label2.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label2.setTitle("中級", for: UIControl.State.normal)
        }
        if selectTypequiz == 1 && firstPoint >= 2  {
            label2.isEnabled = true
            label2.setTitle("中級", for: UIControl.State.normal)
            label2.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label3.isEnabled = true
            label3.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label3.setTitle("上級", for: UIControl.State.normal)
        }
        if selectTypequiz == 2 && secondPoint >= 1 {
            label2.isEnabled = true
            label2.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label2.setTitle("中級", for: UIControl.State.normal)
        }
        if selectTypequiz == 2 && secondPoint >= 2 {
            label2.isEnabled = true
            label2.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label2.setTitle("中級", for: UIControl.State.normal)
            label3.isEnabled = true
            label3.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label3.setTitle("上級", for: UIControl.State.normal)
            
        }
        if selectTypequiz == 3 && thirdPoint >= 1 {
            label2.isEnabled = true
            label2.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label2.setTitle("中級", for: UIControl.State.normal)
        }
        if selectTypequiz == 3 && thirdPoint >= 2 {
            label2.isEnabled = true
            label2.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label2.setTitle("中級", for: UIControl.State.normal)
            label3.isEnabled = true
            label3.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            label3.setTitle("上級", for: UIControl.State.normal)
            
        }
    }
    @objc func returnAction(_sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @objc func nextButton1(_sender: UIButton) {
        selectTag = _sender.tag + 1
        let qv = QuizViewController()
        qv.modalTransitionStyle = .crossDissolve
        qv.modalPresentationStyle = .fullScreen
        qv.selectTypequiz = selectTypequiz
        qv.selectLevel = selectTag
        self.present(qv, animated: true, completion: nil)
    }
    @objc func nextButton2(_sender: UIButton) {
        selectTag = _sender.tag + 2
        let qv = QuizViewController()
        qv.modalTransitionStyle = .crossDissolve
        qv.modalPresentationStyle = .fullScreen
        qv.selectTypequiz = selectTypequiz
        qv.selectLevel = selectTag
        self.present(qv, animated: true, completion: nil)
    }
    @objc func nextButton3(_sender: UIButton) {
        selectTag = _sender.tag + 3
        let qv = QuizViewController()
        qv.modalTransitionStyle = .crossDissolve
        qv.modalPresentationStyle = .fullScreen
        qv.selectTypequiz = selectTypequiz
        qv.selectLevel = selectTag
        self.present(qv, animated: true, completion: nil)
    }
}
class MyView3: UIView {
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














