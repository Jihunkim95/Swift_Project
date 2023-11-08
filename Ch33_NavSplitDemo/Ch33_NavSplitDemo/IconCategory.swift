//
//  IconCategory.swift
//  Ch33_NavSplitDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

// 33.3 아이콘 카테고리 구조체 선언
struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}



