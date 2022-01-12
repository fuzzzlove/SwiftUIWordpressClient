import CachedAsyncImage
import SwiftUI

struct PostHeaderContentView: View {

    let postHeader: PostHeader

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            if let url = postHeader.embedded.medias?.first?.url {
                CachedAsyncImage(url: url) { phase in
                    switch phase {
                    case.empty:
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(maxWidth: .infinity)

                    case.success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                            .frame(height: 200)
                            .padding(.bottom, 16)
                            .padding(.top, -10)

                    case.failure:
                        ZStack{
                            Image(systemName: "wifi.slash")
                                .foregroundColor(Color(UIColor.black))
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(UIColor.systemGray5))
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                        }

                    @unknown default:
                        EmptyView()
                    }
                }
            }

            VStack(alignment: .leading, spacing: 16) {
                Text(postHeader.title.text)
                    .font(.title2).bold()

                Text(postHeader.date.formattedDateString)
                    .font(.footnote)
            }

            ProgressView("Loading...")
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }

}
