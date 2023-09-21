//
//  WBBaseDetailFlightView.swift
//  WBgetCheapAvia
//
//  Created by Михаил on 20.09.2023.
//

import UIKit

class WBBaseDetailFlightView: WBBaseView {

    private let padding: CGFloat = 5
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 16)
        label.textColor = R.Colors.inactive
        return label
    }()


    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = R.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.Fonts.helveticaRegular(with: 24)
        label.textColor = R.Colors.titleGrey
        label.textAlignment = .left
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 18)
        label.textColor = R.Colors.inactive
        label.textAlignment = .left
        return label
    }()
    
    func configure(with title: String? = nil, city: String, date: String, alignment: NSTextAlignment) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = alignment
        
        cityLabel.text = city
        cityLabel.textAlignment = alignment
        
        let dateInLabel = reformatDate(dateString: date)
        dateLabel.text = dateInLabel
        dateLabel.textAlignment = alignment
    }
    
    func reformatDate(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z 'UTC'"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
}

extension WBBaseDetailFlightView {
    override func setupViews() {
        super.setupViews()
        addView(titleLabel)
        addView(contentView)
        contentView.addView(stackView)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(dateLabel)
    }

    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
    

    
}

