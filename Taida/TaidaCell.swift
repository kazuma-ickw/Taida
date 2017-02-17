//
//  TaidaCell.swift
//  Taida
//
//  Copyright © 2017年 K_Ichi. All rights reserved.
//

import UIKit

class TaidaCell: UITableViewCell {
    
    var titleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 300, height: 15));
        titleLabel.text = "oh";
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(titleLabel);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
