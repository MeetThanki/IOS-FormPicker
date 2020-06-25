import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let games = [
        "PUBG",
        "GTA V",
        "Fortnite",
        "Dota 2",
        "Apex Legends",
        "Rainbow Six Siege"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose Game"
        tableView.delegate = self
        tableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { games.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let title = games[indexPath.row]
        let matches = UserDefaults.standard.string(forKey: "game") == title
        
        cell.accessoryType = matches ? .checkmark : .none
        cell.imageView?.image = UIImage(systemName: "circlebadge.fill")
        cell.textLabel?.textColor = matches ? .systemBlue : .secondaryLabel
        cell.imageView?.tintColor = matches ? .systemBlue : .secondaryLabel
        cell.textLabel?.text = title
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(games[indexPath.row], forKey: "game")
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.popViewController(animated: true)
    }

}
