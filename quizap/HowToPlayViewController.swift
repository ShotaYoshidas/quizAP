//
//  HowToPlayViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    let text:UITextView = {
        let t = UITextView()
        t.layer.borderColor = UIColor.black.cgColor
        t.layer.borderWidth = 2
        t.textColor = .black
        t.frame = CGRect(x: UIScreen.main.bounds.width/2 - 150, y: 230, width: 300, height:250)
        t.font = UIFont.systemFont(ofSize: 25)
        t.layer.cornerRadius = 10
        t.isEditable = false
        return t
    }()
    let returnButton:UIButton = {
        let rv = UIButton()
        rv.setTitle("戻る", for: UIControl.State.normal)
        rv.addTarget(self, action: #selector(returnAction), for: UIControl.Event.touchUpInside)
        rv.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rv.layer.cornerRadius = 10
        rv.frame = CGRect(x: UIScreen.main.bounds.width/10, y: 720, width: 100, height: 50)
        rv.layer.backgroundColor = UIColor.white.cgColor
        rv.layer.borderWidth = 0
        rv.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        return rv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(text)
        view.backgroundColor = UIColor(red: 236/255, green: 211/255, blue: 175/255, alpha: 1)
        view.addSubview(returnButton)
    }
    @objc func returnAction(_sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
}




