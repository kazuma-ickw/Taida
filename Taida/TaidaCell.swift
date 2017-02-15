//
//  TaidaCell.swift
//  Taida
//
//  Created by 市川主馬 on 2017/02/12.
//  Copyright © 2017年 市川主馬. All rights reserved.
//

import UIKit

class TaidaCell: UITableViewCell {
    
    var titleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRect(x: 10, y: 2, width: 300, height: 15));
        titleLabel.text = "oh";
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(titleLabel);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
