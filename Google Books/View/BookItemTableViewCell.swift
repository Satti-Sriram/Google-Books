//
//  BookItemTableViewCell.swift
//  Google Books
//
//  Created by SATTI SRIRAM on 18/07/21.
//

import UIKit

class BookItemTableViewCell: UITableViewCell {
    
    let bgView: UIView = {
       let bgView = UIView()
        bgView.backgroundColor = #colorLiteral(red: 0.9486019015, green: 0.8708977103, blue: 0.8470295072, alpha: 1)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = false
        return bgView
    }()
    
    let lblTitle: UILabel = {
       let lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblTitle.font = UIFont.init(name: "System Bold", size: 20)
        lblTitle.textAlignment = .left
        return lblTitle
    }()
    let lblDesc: UILabel = {
       let lblDesc = UILabel()
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        lblDesc.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblDesc.numberOfLines = 2
        lblDesc.font = UIFont.init(name: "System Regular", size: 15)
        lblDesc.textAlignment = .left
        return lblDesc
    }()

    let imgThumb: UIImageView = {
       let imgThumb = UIImageView()
        imgThumb.translatesAutoresizingMaskIntoConstraints = false
        return imgThumb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.SetupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func SetupViews() {
        addSubview(bgView)
        bgView.addSubview(lblTitle)
        bgView.addSubview(lblDesc)
        bgView.addSubview(imgThumb)

        self.bgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.bgView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        self.bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
     
        imgThumb.leftAnchor.constraint(equalTo: self.bgView.leftAnchor, constant: 10).isActive = true
        imgThumb.topAnchor.constraint(equalTo: self.bgView.topAnchor, constant: 10).isActive = true
        imgThumb.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgThumb.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgThumb.bottomAnchor.constraint(equalTo: self.bgView.bottomAnchor, constant: -10).isActive = true
        
        lblTitle.leftAnchor.constraint(equalTo: self.imgThumb.rightAnchor, constant: 10).isActive = true
        lblTitle.heightAnchor.constraint(equalToConstant: 35).isActive = true
        lblTitle.topAnchor.constraint(equalTo: self.bgView.topAnchor, constant: 10).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: self.bgView.rightAnchor, constant: -10).isActive = true
        
        lblDesc.leftAnchor.constraint(equalTo: self.imgThumb.rightAnchor, constant: 10).isActive = true
        lblDesc.heightAnchor.constraint(equalToConstant: 45).isActive = true
        lblDesc.topAnchor.constraint(equalTo: self.lblTitle.bottomAnchor, constant: 10).isActive = true
        lblDesc.rightAnchor.constraint(equalTo: self.bgView.rightAnchor, constant: -10).isActive = true
        lblDesc.bottomAnchor.constraint(greaterThanOrEqualTo: self.bgView.bottomAnchor, constant: -10).isActive = true
     
    }

}
