import AVKit
import CachedAsyncImage
import SwiftUI
import WPArticleView

struct PostContentView: View {

    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            if let url = post.embedded.medias?.first?.url {
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
                Text(post.title.text)
                    .font(.title2).bold()

                Text(post.date.formattedDateString)
                    .font(.footnote)

                WPArticleView(htmlBody: post.content.rendered) { blocks in

                    ForEach(blocks.indices, id: \.self) { id in
                        blocks[id]
                            .padding(.bottom, 6)
                    }

                } text: { attributedText in

                    Text(attributedText)

                } image: { imageURL in

                    CachedAsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }

                } video: { videoURL in

                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .frame(minHeight: 400)
                        .cornerRadius(8)

                }
            }
        }
        .padding(.horizontal, 20)
    }

}

