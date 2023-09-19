//
//  CityDateView.swift
//  WBgetCheapAvia
//
//  Created by Mikhail Ustyantsev on 20.09.2023.
//

import UIKit

final class CityDateView: WBBaseView {
    
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
        label.font = R.Fonts.helveticaRegular(with: 19)
        label.textColor = R.Colors.titleGrey
        label.textAlignment = .left
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 15)
        label.textColor = R.Colors.inactive
        label.textAlignment = .left
        return label
    }()
    
    func configure(city: String, date: String) {
        let dateInLabel = reformatDate(dateString: date)
        cityLabel.text = city
        dateLabel.text = dateInLabel
    }
    
}


extension CityDateView {
    
   override func setupViews() {
       super.setupViews()
       addView(stackView)
       stackView.addArrangedSubview(cityLabel)
       stackView.addArrangedSubview(dateLabel)
   }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
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
