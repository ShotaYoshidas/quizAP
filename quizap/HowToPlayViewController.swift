//
//  HowToPlayViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    let returnButton:UIButton = {
        let rv = UIButton()
        rv.setTitle("戻", for: UIControl.State.normal)
        rv.addTarget(self, action: #selector(returnAction), for: UIControl.Event.touchUpInside)
        rv.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rv.layer.cornerRadius = 10
        rv.frame = CGRect(x: UIScreen.main.bounds.width/10, y: 720, width: 100, height: 50)
        rv.layer.backgroundColor = UIColor.white.cgColor
        rv.layer.borderWidth = 0
        rv.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        return rv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(returnButton)
    }
    @objc func returnAction(_sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
}




