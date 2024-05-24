class WordEntity {
  String? word;
  String? phonetic;
  String? audioURL;
  List<Phonetics>? phonetics;
  List<Meanings>? meanings;
  License? license;
  List<String>? sourceUrls;

  WordEntity(
      {this.word,
      this.phonetic,
      this.audioURL,
      this.phonetics,
      this.meanings,
      this.license,
      this.sourceUrls});

  WordEntity.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    phonetic = json['phonetic'];

    if (json['phonetics'] != null) {
      phonetics = <Phonetics>[];
      json['phonetics'].forEach((v) {
        if (v['audio'] != '') {
          audioURL = v['audio'];
        }
        phonetics!.add(Phonetics.fromJson(v));
      });
    }
    if (json['meanings'] != null) {
      meanings = <Meanings>[];
      json['meanings'].forEach((v) {
        meanings!.add(Meanings.fromJson(v));
      });
    }
    license =
        json['license'] != null ? License.fromJson(json['license']) : null;
    sourceUrls = json['sourceUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    data['phonetic'] = phonetic;
    if (phonetics != null) {
      data['phonetics'] = phonetics!.map((v) => v.toJson()).toList();
    }
    if (meanings != null) {
      data['meanings'] = meanings!.map((v) => v.toJson()).toList();
    }
    if (license != null) {
      data['license'] = license!.toJson();
    }
    data['sourceUrls'] = sourceUrls;
    return data;
  }
}

class Phonetics {
  String? text;
  String? audio;
  String? sourceUrl;
  License? license;

  Phonetics({this.text, this.audio, this.sourceUrl, this.license});

  Phonetics.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    audio = json['audio'];
    sourceUrl = json['sourceUrl'];
    license =
        json['license'] != null ? License.fromJson(json['license']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['audio'] = audio;
    data['sourceUrl'] = sourceUrl;
    if (license != null) {
      data['license'] = license!.toJson();
    }
    return data;
  }
}

class License {
  String? name;
  String? url;

  License({this.name, this.url});

  License.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;

  Meanings({
    this.partOfSpeech,
    this.definitions,
  });

  // Meanings.fromJson(Map<String, dynamic> json) {
  //   partOfSpeech = json['partOfSpeech'];
  //   if (json['definitions'] != null) {
  //     definitions = <Definitions>[];
  //     json['definitions'].forEach((v) {
  //       definitions!.add(Definitions.fromJson(v));
  //     });
  //   }
  // }

  Meanings.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['partOfSpeech'] = partOfSpeech;
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  String? definition;
  String? example;

  Definitions({this.definition, this.example});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    example = json['example'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['definition'] = definition;
    data['example'] = example;
    return data;
  }
}
