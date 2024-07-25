import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchEmployees(completion: @escaping ([Employee]?) -> Void) {
        guard let url = URL(string: "https://dummyapis.com/dummy/employee") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let employees = try JSONDecoder().decode([Employee].self, from: data)
                completion(employees)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
