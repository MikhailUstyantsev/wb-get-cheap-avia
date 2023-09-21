//
//  FlightTableViewCell.swift
//  WBgetCheapAvia
//
//  Created by Mikhail Ustyantsev on 19.09.2023.
//

import UIKit

class FlightTableViewCell: UITableViewCell {

    var likeButtonPressed: () -> Void = {}
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.active
        label.font = R.Fonts.helveticaBold(with: 22)
        label.textAlignment = .left
        return label
    }()
    
    private var likeImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
//        view.image = R.Images.FlightTableViewCell.unliked
        return view
    }()
    
    private let spacer = UIView()
    
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceLabel, spacer, likeImageView])
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
    }()
    
    private let departureView = CityDateView()
    private let arrivalView = CityDateView()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.Images.FlightTableViewCell.arrow
        return imageView
    }()
    
    private lazy var destinstionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [departureView, arrowImageView, arrivalView])
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle,
        reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier:
        reuseIdentifier)
        setupViews()
        setupHierarchy()
        setupLayout()
    }
     
       required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }

    func update(with flight: Flight) {
        priceLabel.text = "\(flight.price) р."
        departureView.configure(city: flight.startCity.rawValue, date: flight.startDate)
        arrivalView.configure(city: flight.endCity, date: flight.endDate.rawValue)
    }
    
    func configurelikeImageView(_ image: UIImage) {
        likeImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupViews() {
      
    }
    
    private func setupHierarchy() {
        contentView.addView(priceStackView)
        contentView.addView(destinstionStackView)
    }
    
    private func setupLayout() {
        let margins = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            priceStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            priceStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            priceStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            destinstionStackView.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 8),
            destinstionStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            destinstionStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            destinstionStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
        ])
    }
    
    @objc private func tappedLikeButton() {
        print("Like Button tapped")
        likeButtonPressed()
    }

}
