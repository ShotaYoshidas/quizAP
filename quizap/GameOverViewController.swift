//
//  GameOverViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

class GameOverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let viewWidth:CGFloat = self.view.frame.width
        let viewHeignt:CGFloat = self.view.frame.height
        print(viewWidth)
        print(viewHeignt)
       
      let gamecverLabel = UILabel()
        gamecverLabel.frame = CGRect(x: viewWidth/5, y: viewHeignt/4, width: 230, height:50)
        gamecverLabel.text = "GAME OVER"
        self.view.addSubview(gamecverLabel)
        gamecverLabel.textColor = .black
        gamecverLabel.font = UIFont.systemFont(ofSize: 40)
        
        let revengeButton = UIButton()
        revengeButton.addTarget(self, action: #selector(self.revengeEvent(_sender:)), for: UIControl.Event.touchUpInside)
        revengeButton.setTitle("REVENGE", for: UIControl.State.normal)
        self.view.addSubview(revengeButton)
        revengeButton.frame = CGRect(x: viewWidth/6, y: 600, width: 110, height: 50)
        revengeButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        revengeButton.layer.borderWidth = 2
        revengeButton.layer.borderColor = UIColor.black.cgColor
        
        let topButton = UIButton()
        topButton.addTarget(self, action: #selector(self.topReturn(_sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(topButton)
        topButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        topButton.setTitle("TOP", for: UIControl.State.normal)
        topButton.frame = CGRect(x: viewWidth/2+20, y: 600, width: 110, height: 50)
        topButton.layer.borderWidth = 2
        topButton.layer.borderColor = UIColor.black.cgColor
        
        
    }
    @objc func revengeEvent(_sender: UIButton) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
    @objc func topReturn(_sender: UIButton) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
}
    
