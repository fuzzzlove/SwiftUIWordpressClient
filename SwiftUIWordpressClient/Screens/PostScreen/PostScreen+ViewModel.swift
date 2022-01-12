import Combine
import SwiftUI

extension PostScreen {

    final class ViewModel: ObservableObject {

        @Published var post: Post?
        @Published var error: Error?

        private var cancellable: AnyCancellable?

        init(id: Int) {
            let url = URL.makeEndpointURL(relativePath: "posts/\(id)/?_embed")!

            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: Post.self, decoder: JSONDecoder.wpDecoder)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case .failure(let error):
                            self.error = error
                        case .finished:
                            break
                        }
                    },
                    receiveValue: { post in
                        self.post = post
                    }
                )
        }

    }

}
