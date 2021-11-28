//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharactersScreen: View {
    let store: Store<CharactersState, CharactersAction>
    @State var scaleFactorW: CGFloat = UIScreen.main.bounds.size.width / 375
    @State var scaleFactorH: CGFloat = UIScreen.main.bounds.size.height / 812
    @State var data: [CharacterModel] = dummyCharactersArray
    @State var grid: [Int] = []

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color(Asset.Colors.blackBG.color)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    // NavigationView
                    NavigationView(
                        scaleFactorW: self.$scaleFactorW,
                        scaleFactorH: self.$scaleFactorH
                    )

                    // Search and Filter
                    SearchAndFilter(
                        scaleFactorW: self.$scaleFactorW,
                        scaleFactorH: self.$scaleFactorH
                    )

                    // ScrollView with Cards
                    CharactersScrollView(
                        scaleFactorW: self.$scaleFactorW,
                        scaleFactorH: self.$scaleFactorH,
                        data: self.$data,
                        grid: self.$grid
                    )
                }
            }
            .edgesIgnoringSafeArea([.top, .horizontal])
            .onAppear {
//                viewStore.send(.onAppear)
                self.generateGrid()
                print(self.grid.count)
                print(self.grid)
            }
        }
    }

    // перенести в редьюсер для .onAppear
    func generateGrid() {
        for row in stride(from: 0, to: self.data.count, by: 2) where row != self.data.count {
            self.grid.append(row)
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen(
            store: Store(
                initialState: CharactersState(),
                reducer: charactersReducer,
                environment: CharactersEnvironment()
            )
        )
    }
}
