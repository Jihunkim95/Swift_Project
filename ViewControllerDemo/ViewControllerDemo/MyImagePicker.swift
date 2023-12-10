//
//  MyImagePicker.swift
//  MyImagePicker
//
//  Created by 김지훈 on 2023/11/20.
//

import SwiftUI

//62.3 UIImagePickerController 래핑하기
struct MyImagePicker: UIViewControllerRepresentable {
    
    //MyImagePicker바인딩
    @Binding var imagePickerVisivle: Bool
    @Binding var selectedImage: Image?
    
    func makeUIViewController(context:
              UIViewControllerRepresentableContext<MyImagePicker>) ->
                      UIImagePickerController {
        let picker = UIImagePickerController()
                          
        //두 개의 상태프로퍼티 바인딩을 통해 전달하기
        picker.delegate = context.coordinator

        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MyImagePicker>) {
        
    }
    
    //코디네이터
    class Coordinator: NSObject, UINavigationControllerDelegate,
                         UIImagePickerControllerDelegate {
    
        @Binding var imagePickerVisible: Bool
        @Binding var selectedImage: Image?
    
        init(imagePickerVisible: Binding<Bool>,
                          selectedImage: Binding<Image?>) {
            _imagePickerVisible = imagePickerVisible
            _selectedImage = selectedImage
        }
    
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo
                    info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage =
                info[UIImagePickerController.InfoKey.originalImage] as!
                                                                   UIImage
            selectedImage = Image(uiImage: uiImage)
            imagePickerVisible = false
        }
    
        func imagePickerControllerDidCancel(_
                            picker: UIImagePickerController) {
            imagePickerVisible = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePickerVisible: $imagePickerVisivle, selectedImage: $selectedImage)
    }
    
}

//
//struct MyImagePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        MyImagePicker()
//    }
//}
