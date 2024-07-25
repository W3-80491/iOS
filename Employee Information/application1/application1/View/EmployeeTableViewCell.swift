import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var employeeNameLabel: UILabel!

    func configure(with employee: Employee) {
        employeeNameLabel.text = employee.name
        if let url = URL(string: employee.imageUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.employeeImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}

