//
//  Constants.swift
//  YoutubePorject
//
//  Created by Alexandre de Oliveira Nepomuceno on 28/06/20.
//  Copyright © 2020 Alexandre de Oliveira Nepomuceno. All rights reserved.
//

import Foundation

struct Constants{
    static var API_KEY = "AIzaSyDjCb8vn_PD7rhuPpYxdXKAkVTadrmJ2S8"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
   
}
