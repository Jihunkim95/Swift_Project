//
//  Ch24Concurrency3.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/19.
//

import SwiftUI


struct ConcurrencyView3: View {
    var body: some View {
        Button(action: {
            // 동기 함수에서 비동기 함수 호출
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }

    // 작업 그룹
    // 동적인 조건에 따라 여러 작업을 동시에 생성하고 실행해야 하는 상황
    // withTaskGroup() 함수 이용
    // addTask() 함수를 호출하여 각각의 새롱누 작업을 추가
    // cancelAll() 그룹의 모둔 작업을 취소하는 메서드
    // isCancelled 작업 그룹이 이미 취소되었는지 여부를 확인하는 속성
    // isEmpty 작업 그룹 내에 작업이 남아 있는지 여부를 확인하는 속성
    func doSomething() async {
        print("Start \(Date())")

        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5 {
                group.addTask {
                    return (i, await takeTooLong())
                }
            }
        }
        print("End \(Date())")
    }

    func takeTooLong() async -> Date {
        sleep( UInt32.random(in: 1...5) )            // 랜덤 초 지연
        return Date()
    }
}
#Preview {
    ConcurrencyView()
}
