//
//  ViewController.swift
//  WBgetCheapAvia
//
//  Created by Mikhail Ustyantsev on 18.09.2023.
//

import UIKit

class MainViewController: BaseController {

    private let tableView = UITableView()
    
    var onUpdate: () -> Void = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        WBService.instance.getCheapFlights(completion: onUpdate)
    }


}

extension MainViewController {
    
    override func addViews() {
        super.addViews()
        view.addView(tableView)
    }
    
    override func constraintViews() {
      super.constraintViews()
        let margins = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: margins.topAnchor),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FlightTableViewCell.self, forCellReuseIdentifier: R.Strings.Main.cellIdentifier)
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WBService.instance.flights.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.Strings.Main.cellIdentifier, for: indexPath) as? FlightTableViewCell else { return UITableViewCell() }
        let flight = WBService.instance.flights[indexPath.row]
        cell.update(with: flight)
        return cell
    }
    
    
}


extension MainViewController: UITableViewDelegate {
    
}
