//
// Created by DiuminPM on 24.02.2022.
//

import Foundation

class NetworkService {

    let urlFactory: URLFactory

    init(urlFactory: URLFactory) {
        self.urlFactory = urlFactory
    }

    func baseRequest<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.wrongUrl))
            return
        }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.dataIsNill))
                }
                return
            }

            let decoder = JSONDecoder()
            do {
                let decodedObject = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedObject))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        } .resume()
    }

}

enum NetworkError: Error {
    case wrongUrl
    case dataIsNill
}