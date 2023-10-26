//
//  ActorView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI

struct ActorView: View {
    @State private var result = ""
    var body: some View {
        
        VStack{
            Text("Acter 이해하기")
            Button("Enter", action: {Task{await someFunction()}}
            ).frame(width: 50,height: 40).border(Color.white, width: 2)
            
            Text("결과 : \(result)")
        }
        
    }
    actor BuildMessage{
        var message: String = ""
        let greeting: String = "Hello"
        
        func setName(name: String){
            self.message = "\(greeting)\(name)"
        }
    }
    func someFunction() async ->String {
        let builder = BuildMessage()
        await builder.setName(name: " Jane Smith")
        let message = await builder.message
        result = message
        return result
    }
}

#Preview {
    ActorView()
}
