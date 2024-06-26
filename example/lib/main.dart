import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// I picked these links & images from internet
  final String _errorImage =
      "https://i.ytimg.com/vi/z8wrRRR7_qU/maxresdefault.jpg";
  /*final String _url1 =
      "https://twitter.com/ProductHunt/status/1754637290138390787?t=urbXNHc06COyuqEFYihJBg&s=19";*/
  final String _url1 = "https://youtu.be/SqfMy8LEdRs?si=LVcpY6t0riL22oPd";
  final String _url2 = "https://vt.tiktok.com/ZSFCJBFPb/";
  final String _url3 =
      "https://twitter.com/laravelphp/status/1222535498880692225";
  final String _url4 = "https://www.youtube.com/watch?v=W1pNjxmNHNQ";
  final String _url5 = "https://flutter.dev/";
  final String _url6 = "https://vt.tiktok.com/ZSFCJBFPb/";

  @override
  void initState() {
    super.initState();
    //_getMetadata(_url6);
  }

  void _getMetadata(String url) async {
    bool _isValid = _getUrlValid(url);
    if (_isValid) {
      Metadata? _metadata = await AnyLinkPreview.getMetadata(
        link: url,
        cache: Duration(days: 7),
        proxyUrl: "https://corsproxy.io/?",
        followRedirectsUrl:
            "https://groundworm.com/api/1.4.0/post/CApiGetFinalUrl",
      );
      debugPrint("URL6 => ${_metadata?.title}");
      debugPrint(_metadata?.desc);
    } else {
      debugPrint("URL is not valid");
    }
  }

  bool _getUrlValid(String url) {
    bool _isUrlValid = AnyLinkPreview.isValidLink(
      url,
      protocols: ['http', 'https'],
      hostWhitelist: ['https://youtube.com/'],
      hostBlacklist: ['https://facebook.com/'],
    );
    return _isUrlValid;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Any Link Preview')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnyLinkPreview(
                link: _url1,
                proxyUrl: "https://api.codetabs.com/v1/proxy?quest=",
                followRedirectsUrl:
                    "https://groundworm.com/api/1.4.0/post/CApiGetFinalUrl",
                displayDirection: UIDirection.uiDirectionHorizontal,
                cache: Duration(hours: 0),
                backgroundColor: Colors.grey[300],
                errorWidget: Container(
                  color: Colors.grey[300],
                  child: Text('Oops!'),
                ),
              ),
              /*SizedBox(height: 25),
              AnyLinkPreview(
                link: _url2,
                displayDirection: UIDirection.uiDirectionHorizontal,
                showMultimedia: false,
                bodyMaxLines: 5,
                bodyTextOverflow: TextOverflow.ellipsis,
                titleStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                bodyStyle: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 25),
              AnyLinkPreview(
                displayDirection: UIDirection.uiDirectionHorizontal,
                link: _url3,
                errorBody: 'Show my custom error body',
                errorTitle: 'Next one is youtube link, error title',
              ),
              SizedBox(height: 25),
              AnyLinkPreview(link: _url4),
              SizedBox(height: 25),
              // Custom preview builder
              AnyLinkPreview.builder(
                link: _url5,
                itemBuilder: (context, metadata, imageProvider) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (imageProvider != null)
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.width * 0.5,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (metadata.title != null)
                            Text(
                              metadata.title!,
                              maxLines: 1,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          const SizedBox(height: 5),
                          if (metadata.desc != null)
                            Text(
                              metadata.desc!,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          Text(
                            metadata.url ?? _url5,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
