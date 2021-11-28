//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharacterCard: View {
    let store: Store<CharactersState, CharactersAction>
    let data: CharacterModel

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: viewStore.scaleFactorW * 156, height: viewStore.scaleFactorH * 202)
                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                VStack {
                    Image("dummyCharacterImage")
                        .resizable()
                    //                    .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: viewStore.scaleFactorW * 140, height: viewStore.scaleFactorH * 140)
                        .padding(.top, viewStore.scaleFactorH * 8)
                    Spacer()
                    Text(data.name)
                        .font(Font.appFontSemibold(ofSize: 17))
                        .foregroundColor(.white)
                        .kerning(-0.41)
                        .padding(.vertical, viewStore.scaleFactorH * 16)
                        .frame(width: viewStore.scaleFactorW * 140, height: viewStore.scaleFactorH * 22)
                    Spacer()
                }
            }
            .onTapGesture {
                print("\(self.data.name) selected")
            }
        }

    }
}
