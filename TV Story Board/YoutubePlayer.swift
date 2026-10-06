import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    let videoId: String
    // Use the baseURL you get from your API. This fallback is only a placeholder.
    var baseURL: URL = URL(string: "https://\(Bundle.main.bundleIdentifier?.lowercased() ?? "example.app")")!

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        config.allowsAirPlayForMediaPlayback = true
        config.defaultWebpagePreferences.allowsContentJavaScript = true

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = .black
        webView.navigationDelegate = context.coordinator
        if #available(iOS 16.4, *) { webView.isInspectable = true } // Safari Web Inspector
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let key = "\(videoId)|\(baseURL.absoluteString)"
        guard context.coordinator.loadedKey != key else { return }
        context.coordinator.loadedKey = key

        guard let fileURL = Bundle.main.url(forResource: "youtube", withExtension: "html"),
              let template = try? String(contentsOf: fileURL, encoding: .utf8) else {
            print("youtube.html not found in bundle")
            return
        }

        let origin = baseURL.absoluteString.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let encodedOrigin = origin.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? origin

        let html = template
            .replacingOccurrences(of: "{{VIDEO_ID}}", with: videoId)
            .replacingOccurrences(of: "{{ORIGIN}}", with: encodedOrigin)

        webView.loadHTMLString(html, baseURL: baseURL)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var loadedKey: String?

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("YT nav failed: \(error)")
        }
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print("YT provisional nav failed: \(error)")
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("YT nav finished successfully")
        }
    }
}
