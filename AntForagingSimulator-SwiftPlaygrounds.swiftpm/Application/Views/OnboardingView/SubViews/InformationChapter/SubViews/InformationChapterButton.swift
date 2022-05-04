import SwiftUI

struct InformationChapterButton: View {
    
    enum ArrowDirection: String {
        case forward
        case backward
    }
    
    var action: () -> Void
    
    var targetChapter: InformationChapter?
    
    var buttonDirection: ArrowDirection
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 140, height: 55)
                .foregroundColor(targetChapter == nil ? .gray : .blue)
                .overlay {
                    Image(systemName: "arrow.\(buttonDirection.rawValue)")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                }
        }
        .disabled(targetChapter == nil)
    }
}
