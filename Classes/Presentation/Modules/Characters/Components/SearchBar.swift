//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI
import Combine

struct SearchBar: View {
    @Binding var searchRequest: String?
    @StateObject private var textObserver = TextFieldObserver()

    var body: some View {
        HStack {
            TextField("", text: $textObserver.searchText).placeholder(when: textObserver.searchText.isEmpty) {
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
            .onReceive(textObserver.$debouncedText) { (newValue) in
                switch (searchRequest, newValue) {
                case let (searchRequest, value) where !value.isEmpty && searchRequest != value:
                    withAnimation {
                        self.searchRequest = newValue
                    }
                case (_, _) where textObserver.searchText == textObserver.debouncedText:
                    break
                case let (searchRequest, value) where value.isEmpty && searchRequest != nil:
                    withAnimation {
                        self.searchRequest = nil
                    }
                default:
                    break
                }
            }
            .onAppear {
                textObserver.searchText = searchRequest ?? ""
            }
        }
    }
}

class TextFieldObserver: ObservableObject {
    @Published var debouncedText: String = ""
    @Published var searchText: String = ""

    private var subscriptions = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(
                receiveValue: { value in
                    self.debouncedText = value
                }
            )
            .store(in: &subscriptions)
    }
}
