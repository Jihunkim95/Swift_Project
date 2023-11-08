import SwiftUI
import PhotosUI

struct PhotoPickerSampleView: View {

    @State private var selectedPhoto: PhotosPickerItem?
    @State private var image: Image?

    var body: some View {
        NavigationStack {
            ZStack {
                image?
                    .resizable()
                    .scaledToFit()
                
                Text("URL에서 사진 가져오기")
            }
            .toolbar {
                PhotosPicker(selection: $selectedPhoto,
                             matching: .images) {
                    Image(systemName: "photo.fill")
                }
            }
            .task(id: selectedPhoto) {
                image = try? await  selectedPhoto?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    PhotoPickerSampleView()
}
