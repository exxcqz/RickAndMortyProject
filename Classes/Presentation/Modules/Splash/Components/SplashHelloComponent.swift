//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SplashHelloComponent: View {

    let heightScreen = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            Color(Asset.Colors.blackBG.color).edgesIgnoringSafeArea(.all)
            Image(Asset.SplashImages.splashStars.name)
                .resizable(resizingMode: .stretch)
                .padding()
                .padding(.top, 98.0)
                .edgesIgnoringSafeArea(.top)
            VStack {
                Image(Asset.SplashImages.splashTitles.name)
                    .padding(.top, 60.0)
                LottieView(name: "portal", loopMode: .loop)
                    .scaledToFit()
                    .padding(.horizontal)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 90.0)
        }
    }
}

struct SplashHelloComponent_Previews: PreviewProvider {
    static var previews: some View {
        SplashHelloComponent()
    }
}
