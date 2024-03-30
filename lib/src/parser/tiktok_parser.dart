import 'dart:convert';

import 'package:html/dom.dart';
import 'og_parser.dart';
import 'util.dart';
import 'base.dart';

/// Parses [Metadata] from [<meta property='twitter:*'>] tags
class TikTokParser with BaseMetaInfo {
  /// The [document] to be parse
  final Document? _document;
  TikTokParser(this._document);

  /// Get [Metadata.title] from 'twitter:title'
  @override
  String? get title {
    var jsonString = getScript(
      _document,
      id: '__UNIVERSAL_DATA_FOR_REHYDRATION__',
    );
    if (jsonString != null && jsonString.isNotEmpty) {
      final jsonObj = jsonDecode(jsonString);
      return jsonObj['__DEFAULT_SCOPE__']['webapp.video-detail']['shareMeta']
          ['title'];
    }

    return null;
  }

  /// Get [Metadata.desc] from 'twitter:description'
  @override
  String? get desc {
    var jsonString = getScript(
      _document,
      id: '__UNIVERSAL_DATA_FOR_REHYDRATION__',
    );
    if (jsonString != null && jsonString.isNotEmpty) {
      final jsonObj = jsonDecode(jsonString);
      return jsonObj['__DEFAULT_SCOPE__']['webapp.video-detail']['shareMeta']
          ['desc'];
    }

    return null;
  }

  /// Get [Metadata.image] from 'twitter:image'
  @override
  String? get image {
    var jsonString = getScript(
      _document,
      id: '__UNIVERSAL_DATA_FOR_REHYDRATION__',
    );
    if (jsonString != null && jsonString.isNotEmpty) {
      final jsonObj = jsonDecode(jsonString);
      return jsonObj['__DEFAULT_SCOPE__']['webapp.video-detail']['itemInfo']
          ['itemStruct']['video']['zoomCover']['240'];
    }

    return null;
  }

  /// Twitter Cards do not have a url property so get the url from [og:url], if available.
  @override
  String? get url => OpenGraphParser(_document).url;

  @override
  String toString() => parse().toString();
}
