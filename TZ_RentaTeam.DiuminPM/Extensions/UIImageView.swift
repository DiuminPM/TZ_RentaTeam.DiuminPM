//
// Created by DiuminPM on 25.02.2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(_ url: URL?) {
        self.sd_setImage(with: url, completed: nil)
    }
}
