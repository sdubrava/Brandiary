//
//  alarmstruct.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

struct alarmstruct
{
    var profileimage: UIImage?
    var mainlabel: String?
    var sublabel: String?
    var photo : UIImage?
    
    static func fetchAlarms() -> [alarmstruct]
    {
        var alarms = [alarmstruct]()
        
        let a1 = alarmstruct(profileimage: UIImage(named:"user.png"), mainlabel: "town hall of Bagnolet, Paris, France", sublabel: "Place de l'Hôtel de Ville, 75004 Paris, France", photo: UIImage(named:"pp.png"))
        
        let a2 = alarmstruct(profileimage: UIImage(named:"user.png"), mainlabel: "town hall of Bagnolet, Paris, France", sublabel: "Place de l'Hôtel de Ville, 75004 Paris, France", photo: UIImage(named:"pp.png"))
        
        let a3 = alarmstruct(profileimage: UIImage(named:"user.png"), mainlabel: "town hall of Bagnolet, Paris, France", sublabel: "Place de l'Hôtel de Ville, 75004 Paris, France", photo: UIImage(named:"pp.png"))
           let a4 = alarmstruct(profileimage: UIImage(named:"user.png"), mainlabel: "town hall of Bagnolet, Paris, France", sublabel: "Place de l'Hôtel de Ville, 75004 Paris, France", photo: UIImage(named:"pp.png"))
           let a5 = alarmstruct(profileimage: UIImage(named:"user.png"), mainlabel: "town hall of Bagnolet, Paris, France", sublabel: "Place de l'Hôtel de Ville, 75004 Paris, France", photo: UIImage(named:"pp.png"))
           let a6 = alarmstruct(profileimage: UIImage(named:"user.png"), mainlabel: "town hall of Bagnolet, Paris, France", sublabel: "Place de l'Hôtel de Ville, 75004 Paris, France", photo: UIImage(named:"pp.png"))
        
        alarms.append(a1)
         alarms.append(a2)
         alarms.append(a3)
         alarms.append(a4)
         alarms.append(a5)
        alarms.append(a6)
        
        
        
        return alarms
    
}
    
}
