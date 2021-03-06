//
//  TimelineHeaderCell.swift
//  OneDay
//
//  Created by 정화 on 17/02/2019.
//  Copyright © 2019 teamA2. All rights reserved.
//

import UIKit

class TimelineSectionHeaderView: UIView {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.textColor = .calendarDarkColor
        label.font = .preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 0.4)
        setupView()
    }
    
    fileprivate func setupView() {
        addSubview(headerLabel)
        headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
