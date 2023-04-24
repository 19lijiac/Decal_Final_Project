//
//  AddNoteView.swift
//  Final Project
//
//  Created by Michael Wu on 4/24/23.
//

import SwiftUI

struct AddNoteView: View {
    @State private var noteText: String = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented: Bool = false
    @ObservedObject var navigationManager: ViewNavigationManager
    @EnvironmentObject var noteStore: NoteStore

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $noteText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding()

                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                }

                Button(action: {
                    isImagePickerPresented = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                        Text("Add Picture")
                    }
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                .padding()

                Spacer()
            }
            .navigationBarTitle("Add Note", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
//                submitNote()
                print("Submitted")
            }) {
                Text("Submit")
            })
            .navigationBarItems(leading: backButton)
        }
    }

//    func submitNote() {
//        // Save the noteText and selectedImage
//        // Navigate back to the main view
////        let newNote = Note(id: UUID(), text: noteText, image: selectedImage)
////        noteStore.add(note: newNote)
////
//
//    }
    var backButton: some View {
        Button(action: navigationManager.goToMainFrameView) {
            HStack (spacing: 10) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .frame(width: 20, height: 20)

                Text("Back")
            }
        }
    }
}

//struct AddNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNoteView()
//    }
//}
