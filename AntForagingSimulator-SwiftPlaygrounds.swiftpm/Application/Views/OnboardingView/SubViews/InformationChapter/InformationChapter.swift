import Foundation

class InformationChapter {
    let id = UUID()
    let model: InformationChapterModel
    weak var next: InformationChapter?
    weak var previous: InformationChapter?
    
    var title: String {
        model.title
    }
    
    var text: String {
        model.text
    }
    
    init(title: String, text: String) {
        self.model = InformationChapterModel(title: title, text: text)
    }
}

extension InformationChapter: Equatable {
    static func == (lhs: InformationChapter, rhs: InformationChapter) -> Bool {
        lhs.id == rhs.id
    }
}
