//
//  VideoTableViewCell.swift
//  YoutubePorject
//
//  Created by Alexandre de Oliveira Nepomuceno on 29/06/20.
//  Copyright © 2020 Alexandre de Oliveira Nepomuceno. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageview: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        let http = URL(string: self.video!.thumbnail)!
        var comps = URLComponents(url: http, resolvingAgainstBaseURL: false)!
        comps.scheme = "http"
        let url = comps.url!
        
        // Get the shared URL Session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url.absoluteString != self.video?.thumbnail {
                    
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageview.image = image
                }
                
            }
            
        }
        // Start data task
        dataTask.resume()
    }
    
}
