import SwiftUI

class InformationChapterViewModel: ObservableObject {
    enum ChapterAccessState {
        case next
        case previous
    }
    
    private var firstChapter: InformationChapter?
    private var lastChapter: InformationChapter?
    
    @Published public var currentChapter: InformationChapter?
    
    public var isOnLastChapter: Bool {
        if let currentChapter = currentChapter, let lastChapter = lastChapter {
            return currentChapter == lastChapter
        }
        return false
    }
    
    init(){}
    
    init(from chapters: [InformationChapter]) {
        for chapter in chapters {
            add(chapter: chapter)
        }
    }
    
    public var isEmpty: Bool {
        firstChapter == nil
    }
    
    public func add(chapter: InformationChapter) {
        if isEmpty {
            firstChapter = chapter
            lastChapter = firstChapter
            currentChapter = chapter
        } else if let lastChapter = lastChapter {
            chapter.previous = lastChapter
            lastChapter.next = chapter
        }
        lastChapter = chapter
    }
    
    func present(_ nextState: ChapterAccessState) {
        switch nextState {
        case .next:
            if let nextChapter = currentChapter?.next {
                currentChapter = nextChapter
            }
        case .previous:
            if let previousChapter = currentChapter?.previous {
                currentChapter = previousChapter
            }
        }
    }
}
