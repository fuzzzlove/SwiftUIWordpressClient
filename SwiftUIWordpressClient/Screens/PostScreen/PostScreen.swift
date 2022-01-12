import SwiftUI

// MARK: - View

struct PostScreen: View {

    let postHeader: PostHeader

    @ObservedObject private var viewModel: ViewModel

    init(post: PostHeader) {
        self.postHeader = post
        self.viewModel = .init(id: post.id)
    }

    var body: some View {
        ScrollView {
            if let post = viewModel.post {
                PostContentView(post: post)
            } else {
                PostHeaderContentView(postHeader: postHeader)
            }
        }
    }
        
}

