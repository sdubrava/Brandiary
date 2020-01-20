//
//  UserPost.swift
//  Brandiary
//
//  Created by young on 2020/01/12.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit

protocol Identifiable {
    var id: String?{ get set}
}

struct UserPost :Codable,Identifiable{
    var id:String? = nil
    var name : String
    var hashtag:[String]
    var profile:String
    var caption:String
    var place:String
    var withperson:String
    var post:[String]
    var posttags:[String]
    
    init(name: String,hashtag:[String],profile:String,caption:String,place:String,withperson:String,post:[String],posttags:[String]) {
        self.name = name
        self.hashtag = hashtag
        self.profile = profile
        self.caption = caption
        self.place = place
        self.withperson = withperson
        self.post = post
        self.posttags = posttags
        
    }
}

