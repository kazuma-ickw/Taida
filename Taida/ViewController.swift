//
//  ViewController.swift
//  Taida
//
//  Created by K_Ichi on 2017/01/31.
//  Copyright © 2017年 K_Ichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(self.view.bounds.width)
        print(self.view.bounds.height)
        
        self.tableView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaidaCell = TaidaCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
        print(indexPath)
        let selectedCell: TaidaCell = tableView.cellForRow(at: indexPath) as! TaidaCell
        print(selectedCell)
        let webView: UIWebView = UIWebView(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height / 1.5))
        
        let url = NSURL(string: "https://google.com")
        webView.loadRequest(NSURLRequest(url: url as! URL) as URLRequest)
        selectedCell.window?.addSubview(webView)
        print(tableView.cellForRow(at: indexPath)!)
        tableView.deselectRow(at: indexPath, animated: false)
        
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
        button.setTitle("test", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(ViewController.clickButton), for: .touchUpInside)
        
        selectedCell.window?.addSubview(button)
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
        
    }


}
