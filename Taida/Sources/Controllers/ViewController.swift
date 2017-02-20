//
//  ViewController.swift
//  Taida
//
//  Copyright © 2017年 K_Ichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = UITableView()
    
    let feeds: Array = [
        (title: "google", url: "https://google.com"),
        (title: "google", url: "https://google.com"),
        (title: "google", url: "https://google.com"),
        (title: "google", url: "https://google.com"),
        (title: "google", url: "https://google.com")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(self.view.bounds.width)
        print(self.view.bounds.height)
        
        self.tableView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let v = UIView()
        v.backgroundColor = UIColor.clear
        self.tableView.tableFooterView = v
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaidaCell = TaidaCell()
        cell.feed = Feed(
            feedTitle: feeds[indexPath.row].title,
            feedUrl: URL(string: feeds[indexPath.row].url)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
        print(indexPath)
        let selectedCell: TaidaCell = tableView.cellForRow(at: indexPath) as! TaidaCell
        selectedCell.feed = Feed(feedTitle: "title1", feedUrl: URL(string: "https://google.com")!)
        print(selectedCell)
        let webView: UIWebView = UIWebView(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height * 0.7))
        
        webView.loadRequest(URLRequest(url: selectedCell.feed.url))
        selectedCell.window?.addSubview(webView)
        print(tableView.cellForRow(at: indexPath)!)
        tableView.deselectRow(at: indexPath, animated: false)
        
        let button: UIButton = UIButton(frame: CGRect(x: 10, y: (self.view.bounds.height * 0.7) - 10, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 5
        button.layer.opacity = 0.8
        button.clipsToBounds = true
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(ViewController.clickButton), for: .touchUpInside)
        
        selectedCell.window?.addSubview(button)
        self.tableView.frame = CGRect(x: 0, y: (self.view.bounds.height * 0.8), width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    func clickButton(sender: UIControl) -> Void {
        print("clickButton")
        print(sender)
        let subviews = sender.superview?.subviews
        if let subviews = subviews {
            print(subviews)
        }
        for subview in subviews! {
            print(subview)
            if subview is UIWebView {
                subview.removeFromSuperview()
            }
        }
        sender.removeFromSuperview()
        self.tableView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height)
    }


}
