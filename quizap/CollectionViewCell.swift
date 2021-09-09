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
        cl.textColor = .black
        return cl
    }()
    let character:UIImageView = {
        let c = UIImageView()
        c.clipsToBounds = true
        c.backgroundColor = .white
        c.layer.cornerRadius = 10
        return c
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(character)
        character.pin.top(1).left(1).right(1).bottom(1)
        addSubview(character)
        
        characterLabel.pin.all()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(image:UIImage,text:String) {
        character.image = image
        characterLabel.text  = text
    }
    
}
