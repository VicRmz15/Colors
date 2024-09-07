//
//  ColorListTableViewCell.swift
//  Colors
//
//  Created by Vic Rmz on 04/09/24.
//

import UIKit
import SDWebImage

class ColorListTableViewCell: UITableViewCell {
    
    var photo: Photo?
    
    lazy var textDescription : UILabel = {
        var description = UILabel()
        description.numberOfLines = 0
        description.font = .systemFont(ofSize: 15)
        return description
    }()
    
    lazy var imageCircle : UIImageView = {
        var image = UIImageView()
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.lightGray.cgColor
        return image
    }()
    
    lazy var imageArrow : UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    init(photo : Photo){
        self.photo = photo
        super.init(style: .default, reuseIdentifier: nil)
        self.backgroundColor = .clear
        initUI()
    }
     
    
    func initUI(){
        
        textDescription.text = photo?.title
        self.addSubview(textDescription)
        textDescription.addAnchorsAndCenter(centerX: nil, centerY: true, width: 200, height: 80, left: 30, top: nil, right: nil, bottom: nil)
        
        imageCircle.sd_setImage(with: URL(string: (photo?.thumbnailUrl)!),completed: nil)
        self.addSubview(imageCircle)
        imageCircle.addAnchorsAndCenter(centerX: nil, centerY: true, width: 60, height: 60, left: 15, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: textDescription)
        
        self.addSubview(imageArrow)
        imageArrow.addAnchorsAndCenter(centerX: false, centerY: true, width: 10, height: 10, left: 5, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageCircle)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
