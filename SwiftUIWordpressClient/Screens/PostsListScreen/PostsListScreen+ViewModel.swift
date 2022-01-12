import Combine
import SwiftUI

extension PostsListScreen {

    final class ViewModel: ObservableObject {

        @Published var displayingPostHeaders: [PostHeader] = []
        @Published var error: Error?

        private var cancellable: AnyCancellable?
        private var allPostHeaders: [PostHeader] = []

        init() {
            let url = URL.makeEndpointURL(relativePath: "posts?_fields=author,id,date,title,_links,_embedded&_embed")!

            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [PostHeader].self, decoder: JSONDecoder.wpDecoder)
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
                    receiveValue: { posts in
                        self.displayingPostHeaders = posts
                        self.allPostHeaders = posts
                    }
                )
        }

        func updateSearchString(query: String) {
            if !query.isEmpty {
                displayingPostHeaders = allPostHeaders.filter { $0.title.text.contains(query) }
            } else {
                displayingPostHeaders = allPostHeaders
            }
        }

    }

}
