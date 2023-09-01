
import Foundation

protocol NetworkServiceProtocol {
    func fetchData(completion: @escaping ([ProductModel]) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func fetchData(completion: @escaping ([ProductModel]) -> Void) {
        let menu = DataManager.shared.menu
        completion(menu)
    }
    
    
}
