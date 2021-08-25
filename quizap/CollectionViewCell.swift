//
//  CollectionViewCell.swift
//  quizap
//
//  Created by shota yoshida on 2021/08/18.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let characterLabel:UILabel = {
        let cl = UILabel()
        cl.font = UIFont.boldSystemFont(ofSize: 10)
        cl.textAlignment = .center
        cl.textColor = .black
        return cl
    }()
    
    let character:UIImageView = {
        let c = UIImageView()
        c.layer.borderWidth = 2
        c.layer.cornerRadius = 10
        c.layer.borderColor = UIColor.black.cgColor
        return c
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(characterLabel)
        addSubview(character)
        characterLabel.pin.all()
        character.pin.all()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(image:UIImage,text:String) {
        character.image = image
        characterLabel.text  = text
    }
    
}
