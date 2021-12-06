//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchRequest: String

    var body: some View {
        HStack {
            TextField("", text: $searchRequest).placeholder(when: searchRequest.isEmpty) {
                HStack {
                    Image(Asset.Icons.icSearchSmall.name)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(Asset.Colors.grayDark.name))
                        .frame(width: Layout.scaleFactorW * 20, height: Layout.scaleFactorW * 20)
                    Text(L10n.Placeholder.search)
                        .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                        .kerning(-0.32)
                        .foregroundColor(Color(Asset.Colors.grayDark.name))
                        .frame(height: Layout.scaleFactorW * 20)
                        .scaledToFill()
                }
            }
            .frame(height: Layout.scaleFactorW * 52)
            .padding(.horizontal, Layout.scaleFactorW * 24)
            .background(Color(Asset.Colors.blackCard.name))
            .foregroundColor(Color.white)
            .accentColor(Color(Asset.Colors.primary.name))
            .cornerRadius(16)
        }
    }
}

// MARK: -  Custom Placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

// MARK: -  Dismiss Keyboard
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
