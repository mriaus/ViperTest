import CoreData
import Foundation
import SwiftUI

/*
 Se encara de montar las vistas
 */

struct NotesRouter {
    func listView(context: NSManagedObjectContext) -> some View {
        let persistence = CoreDataStack(context: context)
        let dataLayer = DataLayer(provider: persistence)
        let contentView = NotesListView(presenter: NotesPresenter(interactor: NotesInteractor(model: dataLayer)))

        return contentView
    }

    func detailView(note: NoteViewModel) -> some View {
        NotesDetailView(note: note)
    }
}
