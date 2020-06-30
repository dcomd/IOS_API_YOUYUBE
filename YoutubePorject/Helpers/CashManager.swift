//
//  CashManager.swift
//  YoutubePorject
//
//  Created by Alexandre de Oliveira Nepomuceno on 30/06/20.
//  Copyright © 2020 Alexandre de Oliveira Nepomuceno. All rights reserved.
//

import Foundation


class CashManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(url:String, data: Data?){
        
        cache[url] = data
    }
    static func getVideoCache(url:String)-> Data?{
        
        return cache[url]
    }
}
