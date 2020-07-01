//
//  DetailViewController.swift
//  YoutubePorject
//
//  Created by Alexandre de Oliveira Nepomuceno on 01/07/20.
//  Copyright © 2020 Alexandre de Oliveira Nepomuceno. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    var video : Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.titleLabel.text = ""
        self.dateLabel.text = ""
        self.textView.text = ""
        
        guard video != nil else {
            return
        }
        
        let embebedUrlString = Constants.YU_EMBED_URL + video!.videoId
        
        let url = URL(string: embebedUrlString)
        let request = URLRequest(url: url!)
        self.webView.load( request)
        self.titleLabel.text = video!.title
        let df = DateFormatter()
        df.dateFormat = "EEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        self.textView.text = video!.description
        
        
        
        
        
    }

}
