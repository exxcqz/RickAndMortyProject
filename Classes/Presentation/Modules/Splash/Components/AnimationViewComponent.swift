//
//  Created by Alexander Loshakov on 22.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI
import Lottie

struct AnimationViewComponent: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop

    func makeUIView(context: UIViewRepresentableContext<AnimationViewComponent>) -> UIView {
        let view = UIView()
        let animationView = AnimationView()

        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        animationView.animationSpeed = 1.0
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(animationView)
        NSLayoutConstraint.activate(
            [
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ]
        )
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimationViewComponent>) {}
}
