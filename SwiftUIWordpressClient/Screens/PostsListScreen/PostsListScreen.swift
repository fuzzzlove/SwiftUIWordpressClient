import SwiftUI

// MARK: - View

struct PostsListScreen: View {

    @ObservedObject private var viewModel = ViewModel()
    @State private var query = ""

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.displayingPostHeaders) { postHeader in

                    NavigationLink(destination: PostScreen(post: postHeader)) {
                        PostHeaderView(postHeader: postHeader)
                    }
                    .padding()
                    .background(Color.background)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
            }
            .background(Color(UIColor.systemGray6))
            .navigationBarTitle("Home")
            .listStyle(.plain)
        }
        .accentColor(Color.accentColor)
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: query) {
            viewModel.updateSearchString(query: $0)
        }
    }

}
