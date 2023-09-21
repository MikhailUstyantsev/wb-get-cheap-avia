//
//  DetailViewController.swift
//  WBgetCheapAvia
//
//  Created by Mikhail Ustyantsev on 19.09.2023.
//

import UIKit

class DetailViewController: WBBaseController {

    private let departureView = WBBaseDetailFlightView()
    private let arrivalView = WBBaseDetailFlightView()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.Images.FlightTableViewCell.arrow
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.active
        label.font = R.Fonts.helveticaBold(with: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let padding: CGFloat = 10
    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        button.makeSystem(button)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureButtonImage()
    }
    
   @objc private func likeTapped() {
        viewModel.likeButtonTapped()
        configureButtonImage()
    }
 

}

extension DetailViewController {
    
    override func addViews() {
        super.addViews()
        view.addView(likeButton)
        view.addView(arrowImageView)
        view.addView(departureView)
        view.addView(arrivalView)
        view.addView(priceLabel)
    }
    
    override func constraintViews() {
      super.constraintViews()
        let margins = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            departureView.topAnchor.constraint(equalTo: margins.topAnchor, constant: padding * 5),
            departureView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: padding),
            departureView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -padding),
            
            arrowImageView.topAnchor.constraint(equalTo: departureView.bottomAnchor, constant: 30),
            arrowImageView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            
            arrivalView.topAnchor.constraint(equalTo: arrowImageView.bottomAnchor, constant: 30),
            arrivalView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: padding),
            arrivalView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -padding),
            
            priceLabel.topAnchor.constraint(equalTo: arrivalView.bottomAnchor, constant: 50),
            priceLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            
            likeButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: padding),
            likeButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -padding),
            likeButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -padding),
            
            
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        configureButtonImage()
        departureView.configure(with: "Отправление", city: viewModel.flight?.startCity.rawValue ?? "Test", date: viewModel.flight?.startDate ?? "Test", alignment: .left)
        arrivalView.configure(with: "Прибытие", city: viewModel.flight?.endCity ?? "Test", date: viewModel.flight?.endDate.rawValue ?? "Test", alignment: .right)
        priceLabel.text = "Стоимость перелета\n \(viewModel.flight?.price ?? 0000) р."
    }
    
    private func configureButtonImage() {
        switch viewModel.isFavorite {
        case true: likeButton.setImage(R.Images.FlightTableViewCell.liked, for: .normal)
        case false: likeButton.setImage(R.Images.FlightTableViewCell.unliked, for: .normal)
        }
    }
    
    
}
