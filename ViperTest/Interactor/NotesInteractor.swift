import Foundation
import Combine


/*
 El Interactor contiene también la propiedad @Published viewModels que va a ser la que observe el presenter, en esta variable es donde vamos a poner los objetos de negocio, el interactor es el que se va a encargar de obtenerlos del backend/BBDD y transformarlos en viewModels para la capa de presentación aplicando la lógica oportuna (filtrado, ordenación…etc.)
 */
class NotesInteractor {
    
    private let formatter = DateFormatter()
    private let model: DataLayer
    private var cancellables = Set<AnyCancellable>()
    @Published var noteViewModels: [NoteViewModel] = []
    @Published var showAddButton: Bool = true
    
    init (model: DataLayer) {
        formatter.dateStyle = .medium
        self.model = model
        setup()
    }
    
    // MARK: Private functions
    private func setup() {
        self.model.$notes
            .map({ notes -> [NoteViewModel] in
                return notes.map{
                    NoteViewModel(title: $0.title!, body: $0.body!, date: self.formatter.string(from: $0.date!), id: $0.id!)
                }
            })
            .replaceError(with: [])
            .assign(to: \.noteViewModels, on: self)
            .store(in: &cancellables)
    }
    
    // MARK: Public functions
    func addNewNote() {
        model.addNewNote(title: "Note \(noteViewModels.count)", body: "Note body", date: Date() )
    }
    
    func deleteNote(_ index: IndexSet) {
        
        var notesCopy = noteViewModels
        notesCopy.move(fromOffsets: index, toOffset: 0)
        
        if let noteToDelete = model.notes.filter({ notesCopy.first!.id == $0.id }).first {
            model.delete(noteToDelete)
        }
    }
    
    func deleteAllNotes(){
        model.deleteAll()
    }
}
