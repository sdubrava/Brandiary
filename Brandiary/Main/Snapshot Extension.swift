//
//  Snapshot Extension.swift
//  Brandiary
//
//  Created by young on 2020/01/12.
//  Copyright © 2020 young. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension DocumentSnapshot {
    func decode<T: Decodable>(as objectType:T.Type, includingId:Bool = true) throws -> T{
        
        var documentJson = data()
        if includingId {
            documentJson?["id"] = documentID
        }
        let documentData = try JSONSerialization.data(withJSONObject: documentJson, options: [])
        let decodeObject = try JSONDecoder().decode(objectType, from: documentData)
        return decodeObject
    }
    
}
