# NotesUI

NotesUI is a lightweight and flexible UI library for building note-taking applications on iOS. It provides reusable SwiftUI and UIKit components tailored for displaying and editing notes.

## Features
- **NoteCell**: A customizable SwiftUI view for displaying note previews.
- **UINoteCell**: A UIKit `UITableViewCell` for use in table-based note lists.
- **NoteEditor**: A SwiftUI wrapper around a `UITextView` for rich text editing.
- **UINoteEditor**: A UIKit-based text editor with automatic formatting for note titles.
- **SearchField**: A SwiftUI search field with built-in animations.
- **UISearchField**: A UIKit search bar with delegate support.

## Installation
You can integrate NotesUI into your iOS project via Swift Package Manager:

1. Open Xcode and navigate to `File > Swift Packages > Add Package Dependency`.
2. Enter the repository URL:
   ```
   https://github.com/wolfej94/NotesUI
   ```
3. Select the desired version and add the package.

## Usage

### SwiftUI

#### NoteCell
```swift
import NotesUI
import SwiftUI

struct ContentView: View {
    var body: some View {
        NoteCell(title: "Sample Note",
                 body: "This is a short preview of the note.",
                 textColor: .black,
                 backgroundColor: .yellow)
    }
}
```

#### NoteEditor
```swift
import NotesUI
import SwiftUI

struct EditorView: View {
    @State private var noteText = ""
    @State private var isEditing = false
    
    var body: some View {
        NoteEditor(text: $noteText, 
                   borderColor: .gray, 
                   textColor: .black, 
                   backgroundColor: .white, 
                   isEditing: $isEditing)
    }
}
```

#### SearchField
```swift
import NotesUI
import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        SearchField(placeholder: "Search Notes", 
                    text: $searchText, 
                    cancelButtonTitle: "Cancel",
                    backgroundColor: .white, 
                    placeholderColor: .gray, 
                    textColor: .black, 
                    borderColor: .gray)
    }
}
```

### UIKit

#### UINoteCell
```swift
import NotesUI
import UIKit

class NotesViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UINoteCell(style: .default, reuseIdentifier: "noteCell")
        cell.title = "Sample Note"
        cell.body = "This is a short preview of the note."
        cell.textColor = .black
        return cell
    }
}
```

#### UINoteEditor
```swift
import NotesUI
import UIKit

class EditorViewController: UIViewController {
    private let noteEditor = UINoteEditor(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(noteEditor)
        noteEditor.text = "Edit your note here..."
        noteEditor.backgroundColor = .white
        noteEditor.textColor = .black
    }
}
```

#### UISearchField
```swift
import NotesUI
import UIKit

class SearchViewController: UIViewController, UISearchFieldDelegate {
    private let searchField = UISearchField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
        view.addSubview(searchField)
    }
    
    func searchFieldEditingDidChange(_ searchText: String) {
        print("Search text changed: \(searchText)")
    }
}
```

## License
NotesUI is released under the MIT license. See [LICENSE](LICENSE) for details.
