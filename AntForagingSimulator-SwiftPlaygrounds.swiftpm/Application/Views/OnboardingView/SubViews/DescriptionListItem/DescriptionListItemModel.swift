import Foundation
import SwiftUI

struct DescriptionListItemModel: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let imageName: String
    let imageLabel: String?
    let titleColor: Color
}
