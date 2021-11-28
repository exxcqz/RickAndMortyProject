//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct CharactersScrollView: View {
    @Binding var scaleFactorW: CGFloat
    @Binding var scaleFactorH: CGFloat
    @Binding var data: [CharacterModel]
    @Binding var grid: [Int]

    var body: some View {
        VStack {
            if !self.grid.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing : scaleFactorH * 20) {
                        ForEach(self.grid, id: \.self) { row in
                            HStack(spacing: scaleFactorW * 16) {
                                ForEach(row...row+1, id: \.self) { column in
                                    VStack {
                                        if column != self.data.count {
                                            CharacterCard(
                                                scaleFactorW: self.$scaleFactorW,
                                                scaleFactorH: self.$scaleFactorH,
                                                data: self.data[column]
                                            )
                                        }
                                    }
                                }
                                if row == self.grid.last! && self.data.count % 2 != 0 {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, scaleFactorW * 24)
                }
            }
        }
    }
}
