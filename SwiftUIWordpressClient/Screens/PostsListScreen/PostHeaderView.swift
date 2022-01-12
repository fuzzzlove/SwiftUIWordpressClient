import CachedAsyncImage
import SwiftUI

struct PostHeaderView: View {

    @Environment(\.colorScheme) var colorScheme

    let postHeader: PostHeader

    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 16) {
                Text(postHeader.title.text)
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(colorScheme == .light ? Color.textColorLight : Color.textColorDark)

                Text(postHeader.date.dateWithoutTime)
                    .font(.footnote)
                    .foregroundColor(Color(UIColor.systemGray))
            }

            Spacer()

            if let url = postHeader.embedded.medias?.first?.url {
                CachedAsyncImage(url: url) { phase in
                    switch phase {
                    case.empty:
                        ProgressView()
                            .progressViewStyle(.circular)

                    case.success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)

                    case.failure:
                        ZStack{
                            Image(systemName: "wifi.slash")
                                .foregroundColor(Color.gray)
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color(UIColor.systemGray5))
                                .frame(width: 68, height: 68)
                        }

                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 68, height: 68)
                .clipped()
                .cornerRadius(8)
            }
        }    
    }

}
