//
//  CarData.swift
//  Ch31ListNavDemo
//
//  Created by 김지훈 on 2023/11/02.
//

import Foundation
import SwiftUI

var carData: [Car] = loadJson("carData.json")
//31.5 JSON 데이터 로딩하기
//loadJson() 함수 호출로 초기화 되는 Car 객체들의 배열을 참조하는 변수갖는다
//loadJson() 함수의 코드는 JSON 파일을 로드하는 표준방식이며, 앱을 만들때 사용한다.
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("\(filename) not found")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename):\(error)")
    }
}
