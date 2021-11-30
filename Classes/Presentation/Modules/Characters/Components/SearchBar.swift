//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searching: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(Asset.Colors.blackCard.name))
            HStack {
                Image(Asset.Icons.icSearchSmall.name)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(Asset.Colors.grayDark.name))
                    .frame(width: Layout.scaleFactorW * 20, height: Layout.scaleFactorW * 20)
                TextField(
                    "",
                    text: $searchText,
                    onEditingChanged: { startedEditing in
                        withAnimation {
                            if startedEditing {
                                searching = true
                            }
                        }
                    },
                    onCommit: {
                        withAnimation {
                            if searchText.isEmpty {
                                searching = false
                            } else {
                                print("searching: \(searchText)")
                            }
                        }
                    }
                )
                .placeholder(when: searchText.isEmpty) {
                    Text(L10n.Placeholder.search)
                        .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                        .kerning(-0.32)
                        .foregroundColor(Color(Asset.Colors.grayDark.name))
                        .frame(height: Layout.scaleFactorW * 20)
                        .scaledToFill()
                }
                .frame(width: searching ? nil : Layout.scaleFactorW * 50)
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
        }
        .frame(height: Layout.scaleFactorW * 52)
    }
}

// MARK: -  Custom Placeholder

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
