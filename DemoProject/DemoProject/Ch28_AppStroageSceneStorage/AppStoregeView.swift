//
//  AppStoregeView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct UserName: Encodable, Decodable {
    var firstName : String
    var secondName : String
}
struct AppStoregeView: View {
    @AppStorage("editorText") var editorText: String = "Sample Text"
    @AppStorage("username") var namestore: Data = Data()
    @State var username = UserName(firstName: "", secondName: "")
    
    var body: some View {
        VStack{
            HStack{
                TextField("firstname",text: $username.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("secondName",text: $username.secondName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Button("username 인코딩"){
                let encorder = JSONEncoder()

                if let data = try? encorder.encode(username){
                    namestore = data
                    editorText = data.base64EncodedString()//data타입 string으로 인코딩
                    
                }
            }
            
            Button("username 디코딩"){
                let decoder = JSONDecoder()
                
                if let name = try? decoder.decode(UserName.self, from: namestore){
//                    namestore = data
                    editorText = name.firstName + name.secondName//디코딩

                }
            }
            
            TextEditor(text: $editorText)
                .padding()
                .font(.largeTitle)
                .onAppear(){
                    let decoder = JSONDecoder()
                    if let name = try? decoder.decode(UserName.self, from: namestore){
                        username = name
                        editorText = name.firstName + name.secondName
                    }
                }
            


        }
    }
}

#Preview {
    AppStoregeView()
}
