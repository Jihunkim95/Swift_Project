//
//  ActerView3.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI

actor TimeStore {
    var timeStamps: [Int: Date] = [:]
    func addStamp(task: Int, date: Date)  {
        timeStamps[task] = date
    }
}

struct ActerView3: View {
    var body: some View {
        Text("")
        Button(action: {
            // 동기 함수에서 비동기 함수 호출
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }
    func doSomething() async {

        let store = TimeStore()

        print("Start \(Date())")

        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    await store.addStamp(task: i, date: await takeTooLong())
                }
            }
        }

        for (task, date) in await store.timeStamps {
            print("Task = \(task), Date = \(date)")
        }

        print("End \(Date())")
    }

    func takeTooLong() async -> Date {
        sleep( UInt32.random(in: 1...5) )            // 랜덤 초 지연
        return Date()
    }
}

#Preview {
    ActerView3()
}
