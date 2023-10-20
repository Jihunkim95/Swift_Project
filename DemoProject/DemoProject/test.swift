//
//  test.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/19.
//

import SwiftUI

struct test: View {
    var body: some View {
        Button(action: {
            Task{ await sum(start: 1,end: 100) }
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
        
        
    }
    
    func sumFrom(_ start:Int,_ end:Int) async -> Int{
        var result:Int = 0
        for i in start...end{
            result += i
        }
        return result
    }

    func sum(start: Int,end: Int) async -> Int {
        let a = await sumFrom(start, end / 2)
        let b = await sumFrom(end / 2 + 1, end)
        print(a + b)
    //    print(b)
        return a + b
    }

      // 5050?
}

#Preview {
    test()
}
