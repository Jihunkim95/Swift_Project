//
//  Car.swift
//  Ch31ListNavDemo
//
//  Created by 김지훈 on 2023/10/31.
//

import SwiftUI
//31.4 Car 구조체 추가하기
struct Car : Codable, Identifiable{
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
    
}

