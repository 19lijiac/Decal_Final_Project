//
//  ObservableObject.swift
//  Final Project
//
//  Created by Michael Wu on 4/24/23.
//

import SwiftUI

class NoteStore: ObservableObject {
    @Published var notes: [Note] = []
    
    func add(note: Note) {
        notes.append(note)
    }
}
