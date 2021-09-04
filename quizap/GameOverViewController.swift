//
//  GameOverViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

class GameOverViewController: UIViewController {
    
    let gamecverLabel:UILabel = {
        let g = UILabel()
        g.frame = CGRect(x: UIScreen.main.bounds.width/5, y: UIScreen.main.bounds.height/4, width: 230, height:50)
        g.text = "GAME OVER"
        g.textColor = .black
        g.font = UIFont.systemFont(ofSize: 40)
        return g
    }()
    
    let returnButton:UIButton = {
        let r = UIButton()
        r.addTarget(self, action: #selector(returnAction), for: UIControl.Event.touchUpInside)
        //        rv.addTarget(self, action: #selector(returnAction), for: UIControl.Event.touchUpInside)
        r.setTitle("トップへ", for: UIControl.State.normal)
        r.setTitleColor(UIColor.black, for: UIControl.State.normal)
        r.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
        r.frame = CGRect(x: UIScreen.main.bounds.width/6, y: 600, width: 110, height: 50)
        r.layer.borderWidth = 2
        r.layer.cornerRadius = 10
        r.layer.borderColor = UIColor.black.cgColor
        return r
    }()
    
    //        戻るの挙動がおかしい！
    let topButton:UIButton = {
        let t = UIButton()
//        t.addTarget(self, action: #selector(topReturn), for: UIControl.Event.touchUpInside)
        t.setTitleColor(UIColor.black, for: UIControl.State.normal)
        t.setTitle("リベンジ", for: UIControl.State.normal)
        t.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
        t.frame = CGRect(x: UIScreen.main.bounds.width/2+20, y: 600, width: 110, height: 50)
        t.layer.borderWidth = 2
        t.layer.cornerRadius = 10
        t.layer.borderColor = UIColor.black.cgColor
        return t
    }()
    //
    
    let myView:MyView4 = {
        let mv = MyView4()
        mv.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        return mv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.pin.all()
        view.addSubview(gamecverLabel)
        view.addSubview(returnButton)
        self.view.addSubview(topButton)
        
        
        
    }
    @objc func returnAction(_sender: UIButton) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
}
class MyView4: UIView {
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
        UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1).setFill()
        z.fill()
        z.close()
        
        let y = UIBezierPath()
        y.addArc(withCenter: CGPoint(x:rect.midX/2, y: rect.midY/2), radius:203/2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1).setFill()
        y.fill()
        
        let x = UIBezierPath()
        x.addArc(withCenter: CGPoint(x:rect.midX/2 + rect.midX, y: rect.midY), radius:203/2, startAngle: 0, endAngle: .pi*2, clockwise: false)
        UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1).setFill()
        x.fill()
    }
}


