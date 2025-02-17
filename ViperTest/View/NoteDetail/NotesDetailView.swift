import SwiftUI

struct NotesDetailView: View {
    
    var note: NoteViewModel
    
    var body: some View {
        VStack() {
            Text("Title: \(note.title)")
            Text("Body: \(note.body)")
            Spacer()
        }
        .navigationBarTitle(note.date)
    }
}
