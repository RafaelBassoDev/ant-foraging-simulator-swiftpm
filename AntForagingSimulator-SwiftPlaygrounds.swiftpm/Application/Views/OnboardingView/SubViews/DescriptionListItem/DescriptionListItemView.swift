import SwiftUI

struct DescriptionListItemView: View {
    
    let model: DescriptionListItemModel
    
    var body: some View {
        HStack(alignment: .center) {
            Image(model.imageName, label: model.imageLabel != nil ? Text(model.imageName) : Text(""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 80, maxWidth: 140, minHeight: 80, maxHeight: 140)
                .padding(.leading, 8)
                .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
            
                Text(model.title)
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundColor(model.titleColor)
                
                Text(model.description)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 10)
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .stroke(model.titleColor, lineWidth: 5)
        }
        .padding(8)
    }
}
