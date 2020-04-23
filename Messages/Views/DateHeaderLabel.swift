//
//  DateHeaderLabel.swift
//  Messages
//
//  Created by Jerry Turcios on 4/23/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12

        self.layer.cornerRadius = height / 2
        self.layer.masksToBounds = true

        return CGSize(width: originalContentSize.width + 20, height: height)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .black
        self.font = .boldSystemFont(ofSize: 14)
        self.textAlignment = .center
        self.textColor = .white
    }
}
