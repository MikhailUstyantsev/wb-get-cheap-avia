//
//  ViewController.swift
//  WBgetCheapAvia
//
//  Created by Mikhail Ustyantsev on 18.09.2023.
//

import UIKit

class MainViewController: WBBaseController {

    private let tableView = UITableView()
    private let viewModel = MainViewModel()
    private let activityIndicator = UIActivityIndicatorView()

    let defaults = UserDefaults.standard
    var likedFlights: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likedFlights = defaults.array(forKey: R.Keys.defaults) as? [String] ?? [String]()
        
        activityIndicator.startAnimating()
        viewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
        
        viewModel.getData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}

extension MainViewController {
    
    override func addViews() {
        super.addViews()
        view.addView(tableView)
        view.addView(activityIndicator)
    }
    
    override func constraintViews() {
      super.constraintViews()
        let margins = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: margins.topAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FlightTableViewCell.self, forCellReuseIdentifier: R.Strings.Main.cellIdentifier)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .medium
        activityIndicator.color = R.Colors.active
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.flights.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.Strings.Main.cellIdentifier, for: indexPath) as? FlightTableViewCell else { return UITableViewCell() }
        let flight = viewModel.flights[indexPath.row]
        cell.update(with: flight)
        
        if likedFlights.contains(flight.searchToken) {
            cell.configurelikeImageView(R.Images.FlightTableViewCell.liked ?? UIImage())
        } else {
            cell.configurelikeImageView(R.Images.FlightTableViewCell.unliked ?? UIImage())
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}


extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flight = viewModel.flights[indexPath.row]
        let detailViewModel = DetailViewModel()
        detailViewModel.flight = flight
        detailViewModel.delegate = self
        
        if likedFlights.contains(flight.searchToken) {
            detailViewModel.isFavorite = true
        } else {
            detailViewModel.isFavorite = false
        }
             
        let detailController = DetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    
}


extension MainViewController: DetailViewModelDelegate {
    
    func updateFavorites(searchToken: String?, isFavorite: Bool) {
        guard let searchToken = searchToken else { return }
         let group = DispatchGroup()
        group.enter()
        if isFavorite {
            likedFlights.append(searchToken)
        } else {
            likedFlights.removeAll { $0 == searchToken }
        }
        group.leave()
        group.notify(queue: .global()) {
            self.defaults.set(self.likedFlights, forKey: R.Keys.defaults)
        }
    }

}
