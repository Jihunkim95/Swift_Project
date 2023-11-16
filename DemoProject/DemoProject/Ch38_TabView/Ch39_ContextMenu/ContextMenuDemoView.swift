//
//  ContextMenuView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/09.
//

import SwiftUI

struct ContextMenuDemoView: View {
    
    @State private var foregroundColor: Color = .green
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .font(.largeTitle)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .contextMenu{
                Button{
                    self.foregroundColor = .green
                    self.backgroundColor = .white
                } label: {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                }
                Button(action: {}, label: {
                    Text("Button")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                Button{
                    self.foregroundColor = .white
                    self.backgroundColor = .green
                } label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                }
            }
    }
}

#Preview {
    ContextMenuDemoView()
}
