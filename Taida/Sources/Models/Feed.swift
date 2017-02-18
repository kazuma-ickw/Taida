//
//  Feed.swift
//  Taida
//
//  Copyright © 2017年 K_Ichi. All rights reserved.
//

import Foundation

class Feed {
    
    var title: String
    var url: URL
    
    init(feedTitle: String, feedUrl: URL) {
        title = feedTitle;
        url = feedUrl;
    }
}
