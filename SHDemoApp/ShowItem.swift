//
//  ShowItem.swift
//  SHDemoApp
//
//  Created by Farshad Mousalou on 8/15/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import UIKit

class ShowItemShortModel : NSObject{
    
    var title : String = ""
    var genres : String = ""
    var duration : String = "0m"
    var rating : String = "0.0"
    var summary : String = ""
    var attributedSummary : NSAttributedString?
    
    convenience init(from :ShowItem){
        self.init()
        
        self.title = from.name ?? ""
        self.genres = from.genres?.joined(separator: ", ") ?? " "
        
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour,.minute]
        
        if let duration = formatter.string(from: from.runtime * 60) {
            self.duration = duration
        }
        
        self.rating = String(from.rating)
        
        if let htmlSummery = from.summary {
            
            if let attributeHtmlString = try? NSAttributedString(data: htmlSummery.data(using: .utf8)!,
                                                            options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType],
                                                            documentAttributes: nil) {
                
                self.attributedSummary = attributeHtmlString
                self.summary = attributeHtmlString.string
                
            }
            
        }
        
        
        
    }
    
}

class ShowItem: NSObject {

    var id : Int?
    var name : String?
    var genres : [String]?
    var status : String?
    var runtime : TimeInterval = 0
    var rating : Float = 0.0
    var network : String?
    var image : URL?
    var thumbImage : URL?
    var summary : String?
    
    lazy var short : ShowItemShortModel = {
        return ShowItemShortModel(from:self)
    }()
    
    convenience init(with json:[String:Any]){
        self.init()
        self.parse(json:json)
    }
    
    private func parse(json : [String:Any]){
        
        if let id = json[ShowServerKeys.id] as? Int {
            self.id = id
        }
        
        if let name = json[ShowServerKeys.name] as? String{
            self.name = name
        }
        
        if let genres = json[ShowServerKeys.genres] as? [String] {
            self.genres = genres
        }
        
        if let status = json[ShowServerKeys.status] as? String{
            self.status = status
        }
        
        if let duration = json[ShowServerKeys.runtime] as? TimeInterval {
            self.runtime = duration
        }
        
        if let summary = json[ShowServerKeys.summary] as? String {
            self.summary = summary
        }
        
        if let rating = json[ShowServerKeys.Rating.rating] as? [String:Any],
           let avrage = rating[ShowServerKeys.Rating.average] as? Float {
            self.rating = avrage
        }
        
        if let network = json[ShowServerKeys.Network.network] as? [String:Any],
            let networkName = network[ShowServerKeys.Network.name] as? String {
            self.network = networkName
        }
        
        if let images = json[ShowServerKeys.Image.images] as? [String:Any]{
            
            if let thumbImage = images[ShowServerKeys.Image.thumb] as? String,
                let thumURL = URL(string:thumbImage.replacingOccurrences(of: "http", with: "https"))  {
                self.thumbImage = thumURL
            }
            
            if let originImage = images[ShowServerKeys.Image.original] as? String,
                let originalURL = URL(string: originImage.replacingOccurrences(of: "http", with: "https")){
                
                self.image = originalURL
                
            }
            
            
        }
        
        
    }
    
}

private struct ShowServerKeys {
    
    static let id = "id"
    static let name = "name"
    static let genres = "genres"
    static let status = "status"
    static let runtime = "runtime"
    static let summary = "summary"
    
    struct Rating {
        static let rating = "rating"
        static let average = "average"
    }
    
    struct Image {
        static let images = "image"
        static let thumb = "medium"
        static let original = "original"
    }
    
    struct Network {
        static let network = "network"
        static let name = "name"
    }
    
}
