//
//  Quiz1ViewController.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/25.
//

import UIKit
import PinLayout

var corectCount:Int = 0
var incorectCount:Int = 0
var quizCount:Int = 0

class QuizViewController: UIViewController {

    var csvArray:[String] = []
    var quizArray:[String] = []
    var quizCount = 0
    var selectLevel = 0
    var selectTypequiz = 0
    var yourAnswer = 0
    var i = 0
    let a = 0
    let b = 0
    //    overlay
    let overlay:UIView = {
        let ol = UIView()
        ol.backgroundColor = .black.withAlphaComponent(0.9)
        ol.layer.borderColor = UIColor.black.cgColor
        ol.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return ol
    }()
    //    canvas
    let canvas:UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.backgroundColor = .clear
        cv.layer.cornerRadius = 10
        cv.frame = CGRect(x: 20, y: Int(UIScreen.main.bounds.height)/2-Int(UIScreen.main.bounds.width)/2, width: Int(UIScreen.main.bounds.width)-40, height: 280)
        return cv
    }()
    //    canvasLabel
    let canvasLabel:UILabel = {
        let cl = UILabel()
        cl.backgroundColor = .white
        cl.textColor = .black
        cl.textAlignment = NSTextAlignment.left
        cl.layer.cornerRadius = 10
        cl.clipsToBounds = true
        cl.numberOfLines = 0
        return cl
    }()
    //    answer Button
    let qanswerButton1:UIButton = {
        let a1 = UIButton()
        a1.layer.borderWidth = 2
        a1.layer.borderColor = UIColor.black.cgColor
        a1.frame = CGRect(x: UIScreen.main.bounds.width/2 - 150, y: 500, width: 300, height: 50)
        a1.setTitleColor(UIColor.black, for: .normal)
        a1.layer.cornerRadius = 10
        a1.tag = 1
        a1.addTarget(self, action: #selector(btnaction), for: UIControl.Event.touchUpInside)
        return a1
    }()
    let qanswerButton2:UIButton = {
        let a2 = UIButton()
        a2.layer.borderWidth = 2
        a2.layer.borderColor = UIColor.black.cgColor
        a2.frame = CGRect(x: UIScreen.main.bounds.width/2 - 150, y: 560, width: 300, height: 50)
        a2.setTitleColor(UIColor.black, for: .normal)
        a2.layer.cornerRadius = 10
        a2.tag = 2
        a2.addTarget(self, action: #selector(btnaction), for: UIControl.Event.touchUpInside)
        return a2
    }()
    let qanswerButton3:UIButton = {
        let a3 = UIButton()
        a3.layer.borderWidth = 2
        a3.layer.borderColor = UIColor.black.cgColor
        a3.frame = CGRect(x: UIScreen.main.bounds.width/2 - 150, y: 620, width: 300, height: 50)
        a3.setTitleColor(UIColor.black, for: .normal)
        a3.layer.cornerRadius = 10
        a3.tag = 3
        a3.addTarget(self, action: #selector(btnaction), for: UIControl.Event.touchUpInside)
        return a3
    }()
    let qanswerButton4:UIButton = {
        let a4 = UIButton()
        a4.layer.borderWidth = 2
        a4.layer.borderColor = UIColor.black.cgColor
        a4.frame = CGRect(x: UIScreen.main.bounds.width/2 - 150, y: 680, width: 300, height: 50)
        a4.setTitleColor(UIColor.black, for: .normal)
        a4.layer.cornerRadius = 10
        a4.tag = 4
        a4.addTarget(self, action: #selector(btnaction), for: UIControl.Event.touchUpInside)
        return a4
    }()
    //    nextButton
    let nextButton:UIButton = {
        let nb = UIButton()
        nb.setTitle("次へ", for: UIControl.State.normal)
        nb.setTitleColor(UIColor.black, for: UIControl.State.normal)
        nb.layer.cornerRadius = 10
        nb.layer.borderWidth = 1
        nb.layer.borderColor = UIColor.black.cgColor
        nb.addTarget(self, action: #selector(nextQuizAction), for: UIControl.Event.touchUpInside)
        return nb
    }()
    //    life haert
    let heartImage1:UIImageView = {
        let h1 = UIImageView()
        h1.frame = CGRect(x: 320, y: 180, width: 40, height: 40)
        h1.image = UIImage(named: "heart-mark_red")
        h1.tintColor = .systemRed
        return h1
    }()
    let heartImage2:UIImageView = {
        let h2 = UIImageView()
        h2.frame = CGRect(x: 280, y: 180, width: 40, height: 40)
        h2.image = UIImage(named: "heart-mark_red")
        h2.tintColor = .systemRed
        return h2
    }()
    let heartImage3:UIImageView = {
        let h3 = UIImageView()
        h3.frame = CGRect(x: 240, y: 180, width: 40, height: 40)
        h3.image = UIImage(named: "heart-mark_red")
        h3.tintColor = .systemRed
        return h3
    }()
    //    juge imamge
    let jugeimageView:UIImageView = {
        let ji = UIImageView()
        ji.frame = CGRect(x: UIScreen.main.bounds.width/2 - 70, y: 150, width: 140, height: 140)
        return ji
    }()
    //    quiz Nom
    let quizNumberLabel: UILabel = {
        let l = UILabel()
        l.frame = CGRect(x: UIScreen.main.bounds.width/2 - 60, y: 100, width: 120, height:50)
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 40)
        return l
    }()
    //    quiz text
    let quizTextView:UITextView = {
        let qt = UITextView()
        qt.layer.borderColor = UIColor.black.cgColor
        qt.layer.borderWidth = 2
        qt.textColor = .black
        qt.frame = CGRect(x: UIScreen.main.bounds.width/2 - 150, y: 230, width: 300, height:250)
        qt.font = UIFont.systemFont(ofSize: 25)
        qt.layer.cornerRadius = 10
        qt.isEditable = false
        return qt
    }()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            corectCount = 0
            incorectCount = 0
            view.addSubview(quizNumberLabel)
            view.addSubview(quizTextView)
            view.addSubview(qanswerButton1)
            view.addSubview(qanswerButton2)
            view.addSubview(qanswerButton3)
            view.addSubview(qanswerButton4)
            view.addSubview(heartImage1)
            view.bringSubviewToFront(heartImage1)
            view.addSubview(heartImage2)
            view.bringSubviewToFront(heartImage2)
            view.addSubview(heartImage3)
            view.bringSubviewToFront(heartImage3)
            //  quizset
            csvArray = loadCSV(filName: "quiz\(selectTypequiz).\(selectLevel)")
            csvArray.shuffle()
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "\(quizCount+1)／\(csvArray.count)"
            quizTextView.text = quizArray[0]
            qanswerButton1.setTitle(quizArray[2], for: .normal)
            qanswerButton2.setTitle(quizArray[3], for: .normal)
            qanswerButton3.setTitle(quizArray[4], for: .normal)
            qanswerButton4.setTitle(quizArray[5], for: .normal)
            
            print("テーマは\(selectTypequiz)レベルは\(selectLevel)")
        }
        @objc func btnaction(sender:UIButton) {
            i = Int(quizArray[1])!
            canvasLabel.text = "[正解]\(quizArray[i+1])\r\r[参考]\(quizArray[6])\r\r[説明]\(quizArray[7])"
            view.addSubview(overlay)
            overlay.addSubview(canvas)
            canvas.addSubview(canvasLabel)
            canvas.addSubview(nextButton)
            view.bringSubviewToFront(canvas)
            view.sendSubviewToBack(quizTextView)
            overlay.isHidden = false
            canvas.isHidden = false
            canvasLabel.isHidden = false
            nextButton.isHidden = false
            nextButton.pin.bottomRight(2).left(250).top(240)
            canvasLabel.pin.all(1)
            if sender.tag == Int(quizArray[1]){
                corectCount += 1
                view.addSubview(jugeimageView)
                overlay.sendSubviewToBack(heartImage1)
                jugeimageView.image = UIImage(named: "correct")
            } else if sender.tag == Int(quizArray[1]){
                corectCount += 1
                view.addSubview(jugeimageView)
                jugeimageView.image = UIImage(named: "correct")
            } else if sender.tag == Int(quizArray[1]){
                corectCount += 1
                view.addSubview(jugeimageView)
                jugeimageView.image = UIImage(named: "correct")
            } else if sender.tag == Int(quizArray[1]){
                corectCount += 1
                view.addSubview(jugeimageView)
                jugeimageView.image = UIImage(named: "correct")
            } else {
                jugeimageView.image = UIImage(named: "incorrect")
                view.addSubview(jugeimageView)
                incorectCount += 1
            }
            //        heart count
            if incorectCount == 1 {
                heartImage1.tintColor = .black
            }else if incorectCount == 2 {
                heartImage2.tintColor = .black
            }else if incorectCount == 3 {
                heartImage3.tintColor = .black
            }
            jugeimageView.isHidden = false
            qanswerButton1.isEnabled = false
            qanswerButton2.isEnabled = false
            qanswerButton3.isEnabled = false
            qanswerButton4.isEnabled = false
            canvas.isHidden = false
            canvasLabel.isHidden = false
            nextButton.isHidden = false
        }
        @objc func nextQuizAction(sender:UIButton) {
            jugeimageView.isHidden  = true
            qanswerButton1.isEnabled = true
            qanswerButton2.isEnabled = true
            qanswerButton3.isEnabled = true
            qanswerButton4.isEnabled = true
            canvasLabel.isHidden = true
            canvas.isHidden = true
            nextButton.isHidden = true
            overlay.isHidden = true
            nextQuiz()
            if incorectCount == 3 {
                let gv = GameOverViewController()
                gv.modalTransitionStyle = .crossDissolve
                gv.modalPresentationStyle = .fullScreen
                self.present(gv, animated: true, completion: nil)
            }
        }
        func nextQuiz() {
            quizCount += 1
            if quizCount < csvArray.count {
                quizArray = csvArray[quizCount].components(separatedBy: ",")
                quizNumberLabel.text = "\(quizCount+1)／\(csvArray.count)"
                quizTextView.text = quizArray[0]
                qanswerButton1.setTitle(quizArray[2], for: .normal)
                qanswerButton2.setTitle(quizArray[3], for: .normal)
                qanswerButton3.setTitle(quizArray[4], for: .normal)
                qanswerButton4.setTitle(quizArray[5], for: .normal)
            } else {
                let sv = ScoreViewController()
                sv.modalTransitionStyle = .crossDissolve
                sv.modalPresentationStyle = .fullScreen
                sv.selectLevel = selectLevel
                sv.selectTypequiz = selectTypequiz
                self.present(sv, animated: true, completion: nil)
            }
        }
        func loadCSV(filName: String) -> [String] {
            //        強制アンラップ！！！！
            let csvBuldle = Bundle.main.path(forResource: filName, ofType: "csv")!
            do {
                let csvData =  try String(contentsOfFile: csvBuldle, encoding: String.Encoding.utf8)
                let lineChange = csvData.replacingOccurrences(of:"\r",with:"\n")
                csvArray = lineChange.components(separatedBy: "\n")
                csvArray.removeLast()
            } catch {
                print("エラー")
            }
            return csvArray
        }
    }
    


