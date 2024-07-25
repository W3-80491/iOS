import UIKit

class SplashViewController: UIViewController {

 override func viewDidLoad() {
 super.viewDidLoad()

 DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
 self.performSegue(withIdentifier: "showHomeScreen", sender: self)
    }
 }
}
