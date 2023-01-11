//___FILEHEADER___

import UIKit
import Firebase
import FirebaseAnalytics

final class ___VARIABLE_Scene___ViewController: UIViewController {
  
  // MARK: - Outlets
  
  // MARK: - Variables
  
  private var viewModel = ___VARIABLE_Scene___ViewModel()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self

  }
}
