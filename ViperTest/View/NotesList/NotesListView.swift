import SwiftUI

/**
 La View contiene la propiedad @ObservedObject presenter: La vista contiene una referencia al presenter con la anotación @ObservedObject, esto quiere decir que es un objeto al que vamos a observar sus propiedades marcadas como @Published.
 */
struct NotesListView: View {
    
    @ObservedObject var presenter: NotesPresenter
    
    var body: some View {
        NavigationView {
            List {
              ForEach (presenter.noteViewModels, id: \.id) { item in
                NavigationLink(item.title, destination: self.presenter.detailView(note: item))
              }
              .onDelete(perform: presenter.delete)
            }
            .navigationBarTitle("Notes", displayMode: .inline)
            .navigationBarItems(trailing: presenter.topButton())
        }
    }
    
    
}


