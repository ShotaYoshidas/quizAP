//
//  Score1ViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit

var firstPoint:Int = 0
var secondPoint:Int = 0
var thirdPoint:Int = 0
var keyValu:Int = 0

class ScoreViewController: UIViewController {
    var selectLevel = 0
    var selectTypequiz = 0
    let scoreLabel:UILabel = {
        let sl = UILabel()
        sl.frame = CGRect(x: UIScreen.main.bounds.width/2 - 95, y: 150, width: 190, height:50)
        sl.textColor = .black
        sl.font = UIFont.systemFont(ofSize: 38)
        sl.text = "\(corectCount)問正解！"
        return sl
    }()
    let commmentLabel:UILabel = {
        let cl = UILabel()
        cl.frame = CGRect(x: UIScreen.main.bounds.width/2 - 110, y: 300, width: 220, height:50)
        cl.textColor = .black
        cl.font = UIFont.systemFont(ofSize: 20)
        cl.numberOfLines = 0
        return cl
    }()
    let topButtonAction:UIButton = {
        let tb = UIButton()
        tb.setTitle("トップへ", for: UIControl.State.normal)
        tb.layer.cornerRadius = 10
        tb.layer.borderWidth = 0
        tb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        tb.frame = CGRect(x: UIScreen.main.bounds.width/2 - 60, y: 650, width: 120, height: 60)
        tb.layer.borderColor = UIColor.white.cgColor
        tb.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tb.addTarget(self, action: #selector(toppButton), for: UIControl.Event.touchUpInside)
        return tb
    }()
    let shareButtonAction:UIButton = {
        let sb = UIButton()
        sb.setTitle("結果をシェア", for: UIControl.State.normal)
        sb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        sb.layer.cornerRadius = 10
        sb.layer.borderWidth = 0
        sb.frame = CGRect(x: UIScreen.main.bounds.width/2 - 60, y: 550, width: 120, height: 60)
        sb.layer.borderColor = UIColor.white.cgColor
        sb.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        sb.addTarget(self, action: #selector(shareButton), for: UIControl.Event.touchUpInside)
        return sb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scoreLabel)
        view.addSubview(commmentLabel)
        view.addSubview(topButtonAction)
        view.addSubview(shareButtonAction)
        print("選択した種類は\(selectTypequiz)選択した階級は\(selectLevel)")
        if Int(selectTypequiz) == 1 && Int(selectLevel) == 1 && firstPoint == 0 {
            keyValu += 1
            firstPoint += 1
            commmentLabel.text = """
            コメント
            レベル２解放
            キャラクターGET!
            """
        } else if Int(selectTypequiz) == 1 && Int(selectLevel) == 2 && firstPoint == 1 {
            keyValu += 1
            firstPoint += 1
            commmentLabel.text = "クリア！レベル３解放!"
            
        } else if Int(selectTypequiz) == 1 && Int(selectLevel) == 3 && firstPoint == 2 {
            keyValu += 1
            firstPoint += 1
            commmentLabel.text = "全クリア！!"
            
        } else if Int(selectTypequiz) == 2 && Int(selectLevel) == 1 && secondPoint == 0 {
            secondPoint += 1
            keyValu += 1
            commmentLabel.text = "クリア！レベル２解放!"
        } else if Int(selectTypequiz) == 2 && Int(selectLevel) == 2 && secondPoint == 1 {
            secondPoint += 1
            keyValu += 1
            commmentLabel.text = "クリア！レベル３解放!"
            
        } else if Int(selectTypequiz) == 2 && Int(selectLevel) == 3 && secondPoint == 2 {
            secondPoint += 1
            keyValu += 1
            commmentLabel.text = "全クリア！！"
            print("北欧はたのむ！＋ポイントゲット③")
        } else if Int(selectTypequiz) == 3 && Int(selectLevel) == 1 && thirdPoint == 0 {
            thirdPoint += 1
            keyValu += 1
            commmentLabel.text = "クリア！レベル２解放!"
        } else if Int(selectTypequiz) == 3 && Int(selectLevel) == 2 && thirdPoint == 1 {
            thirdPoint += 1
            keyValu += 1
            commmentLabel.text = "クリア！レベル３解放!"
        } else if Int(selectTypequiz) == 3 && Int(selectLevel) == 3 && thirdPoint == 2 {
            thirdPoint += 1
            keyValu += 1
            commmentLabel.text = "全クリア！！"
        } else {
            commmentLabel.text = "クリア！"
        }
        let defaults = UserDefaults()
        var fpoint = defaults.integer(forKey: "fponintSaved")
        var spoint = defaults.integer(forKey: "sponintSaved")
        var tpoint = defaults.integer(forKey: "tponintSaved")
        var dkeyValu = defaults.integer(forKey: "dkeyValuSaved")
        fpoint = firstPoint
        spoint = secondPoint
        tpoint = thirdPoint
        dkeyValu = keyValu
        defaults.setValue(dkeyValu, forKey: "dkeyValuSaved")
        defaults.setValue(fpoint, forKey: "fponintSaved")
        defaults.setValue(spoint, forKey: "sponintSaved")
        defaults.setValue(tpoint, forKey: "tponintSaved")
    }
    @objc func printb(sender:UIButton){
        print("aaaaa")
        
    }
    @objc func toppButton(sender:UIButton) {
        presentingViewController?.presentedViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
    @objc func shareButton(sender:Any){
        let activityItems = ["\(corectCount)問正解しました","#神Quiz"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: false)
    }

    }
    


