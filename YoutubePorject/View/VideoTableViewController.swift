//
//  VideoTableViewController.swift
//  YoutubePorject
//
//  Created by Alexandre de Oliveira Nepomuceno on 28/06/20.
//  Copyright © 2020 Alexandre de Oliveira Nepomuceno. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController, ModelDelegate {
    
    let model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.delegate = self
        self.model.getVideos()
        
    }
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        let videoCell = self.videos[indexPath.row]
        cell.setCell(videoCell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
