//
//  FeedViewController.swift
//  Feed
//
//  Created by Lorenzo Limoli on 28/09/22.
//

import UIKit

public protocol FeedProtocol{
    func fetchFeeds(completion: @escaping ([String]) -> Void)
}

public final class FeedViewController: UIViewController {

    static private let _cellIdentifier = "feedCell"
    
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var _feedProtocol: FeedProtocol?
    private var _feeds: [String] = []
    
    @discardableResult
    public func with(feedProtocol: FeedProtocol) -> Self{
        _feedProtocol = feedProtocol
        return self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        fetchFeeds()
    }
    
    private func setupTableView(){
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(UITableViewCell.self, forCellReuseIdentifier: Self._cellIdentifier)
    }
    
    private func fetchFeeds(){
        _feedProtocol?.fetchFeeds{ [weak self] feeds in
            self?._feeds = feeds
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.feedTableView.reloadData()
            }
        }
    }
}


extension FeedViewController: UITableViewDelegate, UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _feeds.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Self._cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = _feeds[indexPath.row]
        
        return cell
    }
}
