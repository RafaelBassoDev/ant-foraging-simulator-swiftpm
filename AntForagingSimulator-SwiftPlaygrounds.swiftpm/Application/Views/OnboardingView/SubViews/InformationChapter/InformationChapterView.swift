import SwiftUI

struct InformationChapterView: View {
    
    @ObservedObject var viewModel: InformationChapterViewModel
    
    @Binding var reachedLastChapterFlag: Bool
    
    var chapter: InformationChapter? {
        viewModel.currentChapter
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(viewModel.isEmpty ? "" : chapter!.title)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: true) {
                    Text(viewModel.isEmpty ? "" : chapter!.text)
                        .font(.system(size: 30, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
            }
            
            HStack(spacing: 60) {
                
                InformationChapterButton(action: {
                    viewModel.present(.previous)
                    reachedLastChapterFlag = viewModel.isOnLastChapter
                }, targetChapter: chapter?.previous, buttonDirection: .backward)
                
                InformationChapterButton(action: {
                    viewModel.present(.next)
                    reachedLastChapterFlag = viewModel.isOnLastChapter
                }, targetChapter: chapter?.next, buttonDirection: .forward)
            }
            .padding(.top, 30)
        }
    }
}

