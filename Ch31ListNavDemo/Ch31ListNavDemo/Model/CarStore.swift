//
//  CarStore.swift
//  Ch31ListNavDemo
//
//  Created by 김지훈 on 2023/11/02.
//

import Foundation
import Combine
//31.6 데이터 저장소 추가하기
//Car 객체 배열 형식의 게시된 프로퍼티를 갖고 있으며, 초기화로 전달된 배열을 게시자로 한다
class CarStore : ObservableObject {
    
    @Published var cars : [Car]
    
    init(cars: [Car]) {
        self.cars = cars
    }
    
}
