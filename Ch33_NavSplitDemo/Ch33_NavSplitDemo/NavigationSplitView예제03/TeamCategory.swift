//
//  TeamCategory.swift
//  Ch33_NavSplitDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import Foundation

// 33.3 팀 카테고리 구조체 선언
struct TeamCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
//    var introduce: [String]
}

