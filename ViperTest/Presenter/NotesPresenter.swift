import SwiftUI
import Combine

/**
 El Presenter contiene la propiedad @Published viewModels que va ser la que va a observar la vista para hacer los cambios en la interfaz cuando este modelo cambie.
 También contiene una referencia al interactor y al Router. 
 El interactor va a contener también un modelo que vamos a observar desde el presenter pero este no es necesario que indiquemos la anotación @ObservedObject ya que no vamos a referenciarlo desde dentro de una View.
 */
class NotesPresenter: ObservableObject {
 
    private let interactor: NotesInteractor
    private var cancellables = Set<AnyCancellable>()
    @Published var noteViewModels: [NoteViewModel] = [] //Recordar que ViewModel aquí sería el modelo que se pinta en la vista
    private let router = NotesRouter()

    init(interactor: NotesInteractor) {
        self.interactor = interactor
        
        interactor.$noteViewModels
        .assign(to: \.noteViewModels, on: self)
        .store(in: &cancellables)
    }
    
    // MARK: Events
    func addNewNote() {
        interactor.addNewNote()
    }
    
    func delete(_ index: IndexSet) {
        interactor.deleteNote(index)
    }
    
    // MARK: Navigation
    func detailView(note: NoteViewModel) -> some View {
        router.detailView(note: note)
    }
    
    func topButton() -> some View {
           if interactor.showAddButton {
               return Button(action: interactor.addNewNote) {
                 Image(systemName: "plus")
               }
           } else {
               return Button(action: interactor.deleteAllNotes) {
                 Image(systemName: "trash")
               }
           }
       }
    

}
