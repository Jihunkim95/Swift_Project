//
//  Car.swift
//  Ch31ListNavDemo
//
//  Created by 김지훈 on 2023/10/31.
//

import SwiftUI

struct Car : Codable, Identifiable{
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
    
}

