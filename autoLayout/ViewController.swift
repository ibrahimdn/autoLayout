//
//  ViewController.swift
//  autoLayout
//
//  Created by ibrahim doğan on 30.09.2018.
//  Copyright © 2018 ibrahimdn. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    func setupView(){
        let imageView = UIImageView()
        let subview = UIView()
        let label = UILabel()
        let likeButton = UIButton(type: .system)
        let DislikeButton = UIButton(type: .system)
        subview.backgroundColor = .lightGray
        view.addSubview(subview)
        subview.snp.makeConstraints { (make) in
            make.top.equalTo(view.bounds.height*0.04)
            make.bottom.equalTo(-view.bounds.height*0.04)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            
        }
        
        imageView.image = UIImage(named: "image.png")
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(view.bounds.height*0.5)
            make.width.equalTo(view.bounds.width*0.8)
            make.top.equalTo(subview).offset(view.bounds.height*0.03)
            make.centerX.equalTo(subview)
        }
       
        let text:String = "ibrahim DOĞAN DİGİTUS Tecnology"
        label.textColor = UIColor.white
        label.text = text
        label.backgroundColor = UIColor.lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        label.lineBreakMode = .byTruncatingTail
        
        
        // label'ın dinamic boyutunu ayarlamak için kullanıldı.
        //"height :" yerine view.frame.size.height'da yazılabilir. Ama ekranda Scroll olma durumunda hata olabilir.
        
        let maxSize = CGSize(width: view.frame.size.width, height: .greatestFiniteMagnitude)
        let size = label.sizeThatFits(maxSize)
        
        print(size.height)
        print(size.width)
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        view.addSubview(label)
        label.sizeToFit()
        label.snp_makeConstraints { (make) in
            make.topMargin.equalTo(imageView.snp_bottomMargin).offset(20)
            make.leftMargin.equalTo(imageView.snp_leftMargin)
            make.rightMargin.equalTo(imageView.snp_rightMargin)
            make.height.equalTo(size.height + 10)
            
        }
        
        likeButton.layer.borderWidth = 2
        likeButton.layer.cornerRadius = 20
        likeButton.layer.borderColor = UIColor.darkGray.cgColor
        likeButton.setTitleColor(UIColor.green, for: .normal)
        likeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 100)
        likeButton.setTitle("V", for: UIControl.State.normal)
        view.addSubview(likeButton)
        likeButton.snp_makeConstraints { (make) -> Void in
            make.centerXWithinMargins.equalTo(label.snp_centerXWithinMargins)
            make.centerYWithinMargins.equalTo(label.snp_centerY).offset(100)
            make.left.equalTo(label.snp_left)
            make.topMargin.equalTo(label.snp_bottomMargin).offset(20)
            make.width.equalTo(view.bounds.width*0.39)
            //priority(.high) olunca label ile tuşlar birbirine giriyor.
            make.height.equalTo(view.bounds.height*0.25).priority(.low)
            make.bottom.equalTo(subview.snp_bottomMargin)
            //make.centerX.equalTo(label.snp_centerX)
            //make.centerY.equalTo(label.snp_centerY)
            //make.topMargin.lessThanOrEqualTo(label.snp_bottomMargin).offset(20).priority(.low)
            //make.right.equalTo(label.snp_rightMargin)
            //make.height.equalTo(view.bounds.height*0.18)
            //make.leftMargin.equalTo(label.snp_leftMargin)
            //make.centerY.equalTo(subview)
            //make.topMargin.greaterThanOrEqualTo(label.snp_bottomMargin).priority(.low)
            
        }
        
        DislikeButton.layer.borderWidth = 2
        DislikeButton.layer.cornerRadius = 20
        DislikeButton.layer.borderColor = UIColor.darkGray.cgColor
        DislikeButton.setTitleColor(UIColor.red, for: .normal)
        DislikeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 100)
        DislikeButton.setTitle("X", for: UIControl.State.normal)
        view.addSubview(DislikeButton)
        DislikeButton.snp_makeConstraints { (make) -> Void in
            make.centerXWithinMargins.equalTo(label.snp_centerXWithinMargins)
            make.centerYWithinMargins.equalTo(label.snp_centerY).offset(100)
            make.right.equalTo(label.snp_right)
            make.topMargin.equalTo(label.snp_bottomMargin).offset(20)
            make.width.equalTo(view.bounds.width*0.39)
            
            //priority(.high) olunca label ile tuşlar birbirine giriyor.
            make.height.equalTo(view.bounds.height*0.25).priority(.low)
            make.bottom.equalTo(subview.snp_bottomMargin)
        }
    }
}

