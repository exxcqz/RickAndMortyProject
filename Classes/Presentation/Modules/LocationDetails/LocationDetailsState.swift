//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct LocationDetailsState: Equatable {
    var location: Location = listLocations[0]
    var residents: [Character] = []
    var indicies: [Int] = []
}
