import Foundation
class EmployeeViewModel {
    var employees = [Employee]()
    var onUpdate: (() -> Void)?
    
    func fetchEmployees() {
        guard let url = URL(string: "https://dummyapis.com/dummy/employee") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                self.employees = try JSONDecoder().decode([Employee].self, from: data)
                DispatchQueue.main.async {
                    self.onUpdate?()
                }
            } catch {
                print("Error decoding: \(error)")
            }
        }.resume()
    }
}

