//
//  TaidaCell.swift
//  Taida
//
//  Copyright © 2017年 K_Ichi. All rights reserved.
//

import UIKit

class TaidaCell: UITableViewCell {
    
    var feed: Feed = Feed(feedTitle: "default", feedUrl: URL(fileURLWithPath: "https://google.com"))
    var titleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 300, height: 15));
        titleLabel.text = feed.title;
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(titleLabel);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
