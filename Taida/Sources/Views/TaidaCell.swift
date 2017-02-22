//
//  TaidaCell.swift
//  Taida
//
//  Copyright © 2017年 K_Ichi. All rights reserved.
//

import UIKit

class TaidaCell: UITableViewCell {
    
    var feed: Feed = Feed(feedTitle: "default", feedUrl: URL(string: "https://google.com")!) {
        didSet {
            self.titleLabel.text = feed.title
        }
    }
    var titleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 300, height: 15));
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(titleLabel);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func onClick() -> Void {
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.bounds.width, height: (self.superview?.frame.height)! - 200)
        let webView: UIWebView = UIWebView(frame: CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.width, height: self.bounds.height))
        
        webView.isUserInteractionEnabled = true
        webView.scrollView.isScrollEnabled = true
        webView.loadRequest(URLRequest(url: feed.url))
        self.addSubview(webView)
        
        let button: UIButton = UIButton(frame: CGRect(x: 10, y: self.bounds.height - 50, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 5
        button.layer.opacity = 0.8
        button.clipsToBounds = true
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(TaidaCell.clickButton), for: .touchUpInside)
        
        self.addSubview(button)
    }
    
    func clickButton(sender: UIControl) -> Void {
        print("clickButton")
        print(sender)
        
        if let superview = sender.superview {
            for subview in superview.subviews {
                print(subview)
                if subview is UIWebView {
                    subview.removeFromSuperview()
                }
            }
        }
        sender.removeFromSuperview()
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.bounds.width, height: 50)
    }
}
