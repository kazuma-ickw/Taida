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
        selectedCell.onClick()
        tableView.contentOffset = CGPoint(x: 0, y: selectedCell.frame.origin.y)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }


}
