enum Language { KANNADA, ENGLISH, HINDI }

class MyData {
  int AndroidSDKVersion = 21;

  Language type = Language.ENGLISH;

  String getPlanetShortNameArrayValue(int index) {
    List<String> engPlanetShortNameArr = [
      "Lg",
      "Rv",
      "Ch",
      "Kj",
      "Bd",
      "Gr",
      "Sk",
      "Sn",
      "Rh",
      "Kt",
      "Md"
    ];
    List<String> kanPlanetShortNameArr = [
      "®",
      "gÀ",
      "ZÀ",
      "PÀÄ",
      "§Ä",
      "UÀÄ",
      "±ÀÄ",
      "±À",
      "gÁ",
      "PÉÃ",
      "ªÀiÁ"
    ];
    // List<String>
    // hinPlanetShortNameArr={"ल","र","च","मं","बु","गु","शु","श","रा","के","मा"};
    // List<String>
    // malPlanetShortNameArr={"ല","ര","ച","കു","ബു","ഗു","ശു","മ്","സ","ശി","മാ"};
    List<String> hinPlanetShortNameArr = [
      "sÉ",
      "U",
      "cÉ",
      "qÉÇ",
      "oÉÑ",
      "aÉÑ",
      "vÉÑ",
      "vÉ",
      "UÉ",
      "Mãü",
      "qÉÉ"
    ];
    List<String> malPlanetShortNameArr = [
      "k",
      "j",
      "O",
      "J¤",
      "f¤",
      "L¤",
      "m¤",
      "h",
      "o",
      "m¢",
      "h¡"
    ];

    if (AndroidSDKVersion >= 21) {
      malPlanetShortNameArr = [
        "ല",
        "ര",
        "ച",
        "കു",
        "ബു",
        "ഗു",
        "ശു",
        "മ്",
        "സ",
        "ശി",
        "മാ"
      ];
    }
    if (type == Language.KANNADA) {
      return kanPlanetShortNameArr[index];
    } else if (type == Language.ENGLISH) {
      return engPlanetShortNameArr[index];
    } else if (type == Language.HINDI) {
      return hinPlanetShortNameArr[index];
    } else {
      return malPlanetShortNameArr[index];
    }
  }

  List<String> getPlanetFullNameArray() {
    // Full planet names
    List<String> engPlanetFullNameArr = [
      "Lagn",
      "Ravi",
      "Chan",
      "Kuja",
      "Buda",
      "Guru",
      "Sukr",
      "Sani",
      "Rahu",
      "Ketu",
      "Mand"
    ];
    List<String> kanPlanetFullNameArr = [
      "®UÀß",
      "gÀ«",
      "ZÀAzÀæ",
      "PÀÄd",
      "§ÄzsÀ",
      "UÀÄgÀÄ",
      "±ÀÄPÀæ",
      "±À¤",
      "gÁºÀÄ",
      "PÉÃvÀÄ",
      "ªÀiÁA¢"
    ];
    // List<String>
    // hinPlanetFullNameArr={"लग्न","रवि","चन्द्र","मंगल","बुध","गुरु","शुक्र","शनि","राहु","केतु","मान्दि"};
    // List<String>
    // malPlanetFullNameArr={"ലഗ്നം","രവി","ചന്ദ്ര","കുജ","ബുധ","ഗുരു","ശുക്ര","മന്ദ","സര്പ്പ","ശിഖി","മാന്ദി"};
    List<String> hinPlanetFullNameArr = [
      "sÉalÉ",
      "UÌuÉ",
      "cÉlSì",
      "qÉÇaÉsÉ",
      "oÉÑkÉ",
      "aÉÑÂ",
      "vÉÑ¢ü",
      "vÉÌlÉ",
      "UÉWÒû",
      "MãüiÉÑ",
      "qÉÉÎlS"
    ];
    List<String> malPlanetFullNameArr = [
      "kÞ«",
      "jl¢",
      "O±zu",
      "J¤Qu",
      "f¤bu",
      "L¤y",
      "m¤±Ju",
      "hzu",
      "ot¸",
      "m¢K£",
      "h¡z¢"
    ];

    if (AndroidSDKVersion >= 21) {
      malPlanetFullNameArr = [
        "ലഗ്നം",
        "രവി",
        "ചന്ദ്ര",
        "കുജ",
        "ബുധ",
        "ഗുരു",
        "ശുക്ര",
        "മന്ദ",
        "സര്പ്പ",
        "ശിഖി",
        "മാന്ദി"
      ];
    }

    if (type == Language.KANNADA) {
      return kanPlanetFullNameArr;
    } else if (type == Language.ENGLISH) {
      return engPlanetFullNameArr;
    } else if (type == Language.HINDI) {
      return hinPlanetFullNameArr;
    } else {
      return malPlanetFullNameArr;
    }
  }

  // KARANA Array
  String getKaranaArrayValue(int index) {
    List<String> engKaranaArr = [
      "Kimstughna",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Sakuni",
      "Chatushpat",
      "Dvirasana"
    ];
    List<String> kanKaranaArr = [
      "QA¸ÀÄÛWÀß",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "§ªÀ",
      "¨Á®ªÀ",
      "PË®ªÀ",
      "vÉÊw®",
      "UÀjd",
      "ªÀtÂd",
      "«¶Ö",
      "±ÀPÀÄ¤",
      "ZÀvÀÄµÁàvï",
      "¢égÀ¸À£À"
    ];
    // List<String>
    // hinKaranaArr={"किम्स्तुघ्न","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","बव","बालव","कौलव","तैतिल","गरिज","वणिग","विष्टि","शकुनि","चतुष्पात","द्विरसन"};
    // List<String>
    // malKaranaArr={"പുഴു","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","സിംഹം","പുലി","പന്നി","കഴുത","ആന","പശു","വിഷ്ടി","പുള്ളു","നാല്കാലി","പാമ്പു"};
    List<String> hinKaranaArr = [
      "ÌMüÇxiÉÑblÉ",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "oÉuÉ",
      "oÉÉsÉuÉ",
      "MüÉæsÉuÉ",
      "iÉæÌiÉsÉ",
      "aÉËUeÉ",
      "uÉÍhÉaÉç",
      "ÌuÉÌ¹",
      "vÉMÑüÌlÉ",
      "cÉiÉÑwmÉÉiÉç",
      "Ì²UxÉlÉ"
    ];
    List<String> malKaranaArr = [
      "d¤r¤",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "o¢«p«",
      "d¤k¢",
      "d¼¢",
      "Jr¤Y",
      "Bc",
      "dm¤",
      "l¢né¢",
      "d¤¾¤",
      "c¡vJ¡k¢",
      "d¡Ø¤"
    ];

    if (AndroidSDKVersion >= 21) {
      malKaranaArr = [
        "പുഴു",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "സിംഹം",
        "പുലി",
        "പന്നി",
        "കഴുത",
        "ആന",
        "പശു",
        "വിഷ്ടി",
        "പുള്ളു",
        "നാല്കാലി",
        "പാമ്പു"
      ];
    }
    if (type == Language.KANNADA) {
      return kanKaranaArr[index];
    } else if (type == Language.ENGLISH) {
      return engKaranaArr[index];
    } else if (type == Language.HINDI) {
      return hinKaranaArr[index];
    } else {
      return malKaranaArr[index];
    }
  }

  // YOGA Array
  String getYogaArrayValue(int index) {
    List<String> engYogaArr = [
      "Vishkambha",
      "Preethi",
      "Ayushman",
      "Soubhagya",
      "Shobhana",
      "Atiganda",
      "Sukarma",
      "Dhriti",
      "Shoola",
      "Ganda",
      "Vruddhi",
      "Dhruva",
      "Vyaaghata",
      "Harshana",
      "Vajra",
      "Siddhi",
      "Vyateepata",
      "Vareeyan",
      "Parigha",
      "Shiva",
      "Siddha",
      "Saadhya",
      "Shubha",
      "Shukla",
      "Brahma",
      "Aindra",
      "Vaidhriti"
    ];
    List<String> kanYogaArr = [
      "«µÀÌA¨sÀ",
      "¦æÃw",
      "DAiÀÄÄµÁä£ï",
      "¸Ë¨sÁUÀå",
      "±ÉÆÃ¨sÀ£À",
      "CwUÀAqÀ",
      "¸ÀÄPÀªÀiÁð",
      "zsÀÈw",
      "±ÀÆ®",
      "UÀAqÀ",
      "ªÀÈ¢Þ",
      "zsÀÄæªÀ",
      "ªÁåWÁvÀ",
      "ºÀµÀðt",
      "ªÀdæ",
      "¹¢Þ",
      "ªÀåwÃ¥ÁvÀ",
      "ªÀjÃAiÀiÁ£ï",
      "¥ÀjWÀ",
      "²ªÀ",
      "¹zÀÞ",
      "¸ÁzsÀå",
      "±ÀÄ¨sÀ",
      "±ÀÄPÀè",
      "§æºÀä",
      "ªÀiÁºÉÃAzÀæ",
      "ªÉÊzsÀÈw"
    ];
    // List<String>
    // hinYogaArr={"विष्कम्भ","प्रीति","आयुष्मान","सौभाग्य","शोभन","अतिगण्ड","सुकर्मा","धृति","शूल","गण्ड","वृद्धि","ध्रुव","व्याघात","हर्षण","वज्र","सिद्धि","व्यतीपात","वरीयान","परिघ","शिव","सिद्ध","साध्य","शुभ","शुक्ल","ब्राह्म","माहेन्द्र","वैधृति"};
    // /List<String>
    // malYogaArr={"വിഷ്കംഭം","പ്രീതി","ആയുഷ്മാന്","സൌഭാഗ്യം","ശോഭനം","അതിഗണ്ഡം","സുകര്മാ","ധൃതി","ശൂലം","ഗണ്ഡം","വൃദ്ധി","ധ്രുവം","വ്യാഘാതം","ഹര്ഷണം","വജ്ര","സിദ്ധി","വ്യതീപതം","വരീയാന്","പരിഘം","ശിവം","സിദ്ധം","സാധ്യം","ശുഭം","ശുക്ലം","ബ്രാഹ്മം","മാഹേന്ദ്രം","വൈധൃതി"};
    List<String> hinYogaArr = [
      "ÌuÉwMüqpÉ",
      "mÉëÏÌiÉ",
      "AÉrÉÑwqÉÉlÉç",
      "xÉÉæpÉÉarÉ",
      "vÉÉãpÉlÉ",
      "AÌiÉaÉhQû",
      "xÉÑMüqÉÉï",
      "kÉ×ÌiÉ",
      "vÉÔsÉ",
      "aÉhQû",
      "uÉ×Ì®",
      "kÉëÑuÉ",
      "urÉÉbÉÉiÉ",
      "WûwÉïhÉ",
      "uÉeÉë",
      "ÍxÉÌ®",
      "urÉiÉÏmÉÉiÉ",
      "uÉUÏrÉÉlÉç",
      "mÉËUbÉ",
      "ÍvÉuÉ",
      "ÍxÉ® ",
      "xÉÉkrÉ",
      "vÉÑpÉ",
      "vÉÑYsÉ",
      "oÉëÉ¼",
      "qÉÉWãûlSì",
      "uÉækÉ×ÌiÉ"
    ];

    List<String> malYogaArr = [
      "l¢n®J«g«",
      "±d£Y¢",
      "Bi¤nä¡u",
      "oªg¡L¬«",
      "©m¡gc«",
      "AY¢LÙ«",
      "o¤Jth¡",
      "b¦Y¢",
      "m¥k«",
      "LÙ«",
      "l¦Ú¢",
      "±b¤l«",
      "l¬¡M¡Y«",
      "ptnX«",
      "l±Q«",
      "o¢Ú¢",
      "l¬Y£d¡Y«",
      "lj£i¡u",
      "dj¢M",
      "m¢l«",
      "o¢Ú«",
      "o¡b¬«",
      "m¤g«",
      "m¤Jë«",
      "±f¡Â«",
      "h¡©p±z«",
      "¨¨lb¦Y¢"
    ];

    if (AndroidSDKVersion >= 21) {
      malYogaArr = [
        "വിഷ്കംഭം",
        "പ്രീതി",
        "ആയുഷ്മാന്",
        "സൌഭാഗ്യം",
        "ശോഭനം",
        "അതിഗണ്ഡം",
        "സുകര്മാ",
        "ധൃതി",
        "ശൂലം",
        "ഗണ്ഡം",
        "വൃദ്ധി",
        "ധ്രുവം",
        "വ്യാഘാതം",
        "ഹര്ഷണം",
        "വജ്ര",
        "സിദ്ധി",
        "വ്യതീപതം",
        "വരീയാന്",
        "പരിഘം",
        "ശിവം",
        "സിദ്ധം",
        "സാധ്യം",
        "ശുഭം",
        "ശുക്ലം",
        "ബ്രാഹ്മം",
        "മാഹേന്ദ്രം",
        "വൈധൃതി"
      ];
    }

    if (type == Language.KANNADA) {
      return kanYogaArr[index];
    } else if (type == Language.ENGLISH) {
      return engYogaArr[index];
    } else if (type == Language.HINDI) {
      return hinYogaArr[index];
    } else {
      return malYogaArr[index];
    }
  }

  // NAKSHATHRA Array
  String getNakArrayValue(int index) {
    List<String> engNakArr = [
      "Ashwini",
      "Bharani",
      "Krittika",
      "Rohini",
      "Mrigasira",
      "Ardra",
      "Punarvasu",
      "Pushya",
      "Ashlesha",
      "Makha",
      "P.Phalguni",
      "U.Phalguni",
      "Hastha",
      "Chitra",
      "Swathi",
      "Visakha",
      "Anuradha",
      "Jyeshtha",
      "Moola",
      "P.Ashadha",
      "U.Ashadha",
      "Shravana",
      "Dhanishtha",
      "Satabhisha",
      "P.Bhadra",
      "U.Bhadra",
      "Revathi"
    ];

    List<String> kanNakArr = [
      "C²é¤",
      "¨sÀgÀtÂ",
      "PÀÈwÛPÁ",
      "gÉÆÃ»tÂ",
      "ªÀÄÈUÀ²gÁ",
      "DzÁæð",
      "¥ÀÅ£ÀªÀð¸ÀÄ",
      "¥ÀÅµÁå",
      "D±ÉèÃµÁ",
      "ªÀÄSÁ",
      "ºÀÄ¨Áâ",
      "GvÀÛgÁ",
      "ºÀ¸ÁÛ",
      "avÁæ",
      "¸Áéw",
      "«±ÁSÁ",
      "C£ÀÄgÁzsÁ",
      "eÉåÃµÁ×",
      "ªÀÄÆ¯Á",
      "¥ÀÇªÁðµÁqsÁ",
      "GvÀÛgÁµÁqsÁ",
      "±ÀæªÀt",
      "zsÀ¤µÁ×",
      "±ÀvÀ©üµÁ",
      "¥ÀÇªÁð¨sÁzÁæ",
      "GvÀÛgÁ¨sÁzÁæ",
      "gÉÃªÀw"
    ];
    // List<String> malNakArr =
    // {"അശ്വതി","ഭരണി","കാര്തിക","രോഹിണി","മകയിരം","തിരുവാതിര","പുണര്തം","പൂയം","ആയില്യം","മകം","പൂരം","ഉത്രം","അത്തം","ചിത്തിര","ചോതി","വിശാകം","അനിഴം","തൃക്കേട്ട","മൂലം","പൂരാടം","ഉത്രാടം","തിരുവോണം","അവിട്ടം","ചതയം","പുരോരുട്ടാതി","ഉത്രട്ടാതി","രേവതി"};
    // List<String> hinNakArr =
    // {"अश्विनी","भरणी","कृत्तिका","रोहिणी","मृगशिरा","आर्द्रा","पुनर्वसु","पुष्या","आश्लेषा","मखा","पूर्वाफाल्गुनी","उत्तराफाल्गुनी","हस्ता","चित्रा","स्वाती","विशाखा","अनुराधा","ज्येष्ठा","मूला","पूर्वाषाढा","उत्तराषाढा","श्रवणा","धनिष्ठा","शतभिषा","पूर्वाभाद्रा","उत्तराभाद्रा","रेवती"};
    List<String> hinNakArr = [
      "AÍµÉÌlÉ",
      "pÉUÍhÉ",
      "M×üÍ¨ÉMüÉ",
      "UÉãÌWûÍhÉ",
      "qÉ×aÉÍvÉUÉ",
      "AÉSìÉï",
      "mÉÑlÉuÉïxÉÑ",
      "mÉÑwrÉÉ",
      "AÉvsÉãwÉÉ",
      "qÉbÉÉ",
      "mÉÔuÉÉïTüsaÉÑÍhÉ",
      "E¨ÉUÉTüsaÉÑÍhÉ",
      "WûxiÉÉ",
      "ÍcÉ§ÉÉ",
      "xuÉÉÌiÉ",
      "ÌuÉvÉÉZÉÉ",
      "AlÉÑUÉkÉÉ",
      "erÉã¸É",
      "qÉÔsÉÉ",
      "mÉÔuÉÉïwÉÉRûÉ",
      "E¨ÉUÉwÉÉRûÉ",
      "´ÉuÉhÉÉ",
      "kÉÌlÉ¸É",
      "vÉiÉÍpÉwÉÉ",
      "mÉÔuÉÉïpÉSìÉ",
      "E¨ÉUÉpÉÉSìÉ",
      "UãuÉÌiÉ"
    ];
    List<String> malNakArr = [
      "Am§Y¢",
      "gjX¢",
      "J¡tY¢J",
      "©j¡p¢X¢",
      "hJi¢j",
      "Y¢yl¡Y¢j",
      "d¤XtY«",
      "d¥i«",
      "Bi¢k¬«",
      "hJ«",
      "d¥j«",
      "D±Y«",
      "A•«",
      "O¢•¢j",
      "©O¡Y¢",
      "l¢m¡J«",
      "Ac¢r«",
      "Y¦©´¶«",
      "h¥k«",
      "d¥j¡T«",
      "D±Y¡T«",
      "Y¢y©l¡X«",
      "Al¢¶«",
      "OYi«",
      "d¤©j¡y¶¡Y¢",
      "D±Y¶¡Y¢",
      "©jlY¢"
    ];

    if (AndroidSDKVersion >= 21) {
      malNakArr = [
        "അശ്വതി",
        "ഭരണി",
        "കാര്തിക",
        "രോഹിണി",
        "മകയിരം",
        "തിരുവാതിര",
        "പുണര്തം",
        "പൂയം",
        "ആയില്യം",
        "മകം",
        "പൂരം",
        "ഉത്രം",
        "അത്തം",
        "ചിത്തിര",
        "ചോതി",
        "വിശാകം",
        "അനിഴം",
        "തൃക്കേട്ട",
        "മൂലം",
        "പൂരാടം",
        "ഉത്രാടം",
        "തിരുവോണം",
        "അവിട്ടം",
        "ചതയം",
        "പുരോരുട്ടാതി",
        "ഉത്രട്ടാതി",
        "രേവതി"
      ];
    }

    if (type == Language.KANNADA) {
      return kanNakArr[index];
    } else if (type == Language.ENGLISH) {
      return engNakArr[index];
    } else if (type == Language.HINDI) {
      return hinNakArr[index];
    } else {
      return malNakArr[index];
    }
  }

  String getVaraArray(int index) {
    List<String> engVara = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    List<String> kanVara = [
      "gÀ«ªÁgÀ",
      "¸ÉÆÃªÀÄªÁgÀ",
      "ªÀÄAUÀ¼ÀªÁgÀ",
      "§ÄzsÀªÁgÀ",
      "UÀÄgÀÄªÁgÀ",
      "±ÀÄPÀæªÁgÀ",
      "±À¤ªÁgÀ"
    ];
    // List<String> hinVara
    // ={"रविवार","सोमवार","मंगलवार","बुधवार","गुरुवार","शुक्रवार","शनिवार",};
    // List<String>
    // malVara={"ഞായറാഴ്ച","തിങ്കഴാഴ്ച","ചൊവ്വാഴ്ച","ബുധ്നാഴ്ച","വ്യാഴാഴ്ച","വെള്ളിയാഴ്ച","ശനിയാഴ്ച"};
    List<String> hinVara = [
      "UÌuÉuÉÉU",
      "xÉÉãqÉuÉÉU",
      "qÉÇaÉsÉuÉÉU",
      "oÉÑkÉuÉÉU",
      "aÉÑÂuÉÉU",
      "vÉÑ¢üuÉÉU",
      "vÉÌlÉuÉÉU"
    ];
    List<String> malVara = [
      "S¡ij¡r®O",
      "Y¢½®Jq¡r®O",
      "¨O¡á¡r®O",
      "f¤bc¡r®O",
      "l¬¡r¡r®O",
      "¨l¾¢i¡r®O",
      "mc¢i¡r®O"
    ];

    if (AndroidSDKVersion >= 21) {
      malVara = [
        "ഞായറാഴ്ച",
        "തിങ്കഴാഴ്ച",
        "ചൊവ്വാഴ്ച",
        "ബുധ്നാഴ്ച",
        "വ്യാഴാഴ്ച",
        "വെള്ളിയാഴ്ച",
        "ശനിയാഴ്ച"
      ];
    }
    if (type == Language.KANNADA) {
      return kanVara[index];
    } else if (type == Language.ENGLISH) {
      return engVara[index];
    } else if (type == Language.HINDI) {
      return hinVara[index];
    } else {
      return malVara[index];
    }
  }

  /**
   * VARA array value
   */
  String getVaraArrayValue(int index) {
    List<String> engVara = [
      "Friday",
      "Saturday",
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday"
    ];
    List<String> kanVara = [
      "±ÀÄPÀæªÁgÀ",
      "±À¤ªÁgÀ",
      "gÀ«ªÁgÀ",
      "¸ÉÆÃªÀÄªÁgÀ",
      "ªÀÄAUÀ¼ÀªÁgÀ",
      "§ÄzsÀªÁgÀ",
      "UÀÄgÀÄªÁgÀ"
    ];
    // List<String> hinVara
    // ={"शुक्रवार","शनिवार","रविवार","सोमवार","मंगलवार","बुधवार","गुरुवार"};
    // List<String>
    // malVara={"വെള്ളിയാഴ്ച","ശനിയാഴ്ച","ഞായറാഴ്ച","തിങ്കഴാഴ്ച","ചൊവ്വാഴ്ച","ബുധ്നാഴ്ച","വ്യാഴാഴ്ച"};
    List<String> hinVara = [
      "vÉÑ¢üuÉÉU",
      "vÉÌlÉuÉÉU",
      "UÌuÉuÉÉU",
      "xÉÉãqÉuÉÉU",
      "qÉÇaÉsÉuÉÉU",
      "oÉÑkÉuÉÉU",
      "aÉÑÂuÉÉU"
    ];

    List<String> malVara = [
      "¨l¾¢i¡r®O",
      "mc¢i¡r®O",
      "S¡ij¡r®O",
      "Y¢½®Jq¡r®O",
      "¨O¡á¡r®O",
      "f¤bc¡r®O",
      "l¬¡r¡r®O"
    ];

    if (AndroidSDKVersion >= 21) {
      malVara = [
        "വെള്ളിയാഴ്ച",
        "ശനിയാഴ്ച",
        "ഞായറാഴ്ച",
        "തിങ്കഴാഴ്ച",
        "ചൊവ്വാഴ്ച",
        "ബുധ്നാഴ്ച",
        "വ്യാഴാഴ്ച"
      ];
    }
    if (type == Language.KANNADA) {
      return kanVara[index];
    } else if (type == Language.ENGLISH) {
      return engVara[index];
    } else if (type == Language.HINDI) {
      return hinVara[index];
    } else {
      return malVara[index];
    }
  }

  String getMenuItemArrayValue(int index) {
    List<String> kanMenuItem = [
      " eÁvÀPÀ «ªÀgÀ ",
      " UÀæºÀ¸ÀÄál ",
      " gÁ² PÀÄAqÀ° ",
      " £ÀªÁA±À PÀÄAqÀ° ",
      " ¨sÁªÀ PÀÄAqÀ° ",
      " ¨sÁªÀ-¸ÀA¢ü ",
      " ¥ÀAZÁAUÀ ",
      " zÀ±Á-¨sÀÄQÛ ",
      " µÀqÀéUÀð ",
      " CµÀÖPÀªÀUÀð ",
      " wæ¸ÀÄámÁ¢ ",
      " zsÀÆªÀiÁ¢ "
    ];
    List<String> engMenuItem = [
      " Basic Details ",
      " Planet Info ",
      " Rashi Kundli ",
      " Navamsha Kundli ",
      " Bhava-Kundli ",
      " Bhava-Sandhi ",
      " Panchanga ",
      " Dasha-Bhukti ",
      " Shadvarga ",
      " Ashtakavarga ",
      " Trisphutadi ",
      " Dhoomaadi "
    ];
    // List<String> malMenuItem=[" ജാതക വിവരം " , " ഗ്രഹസ്പുടം " ,
    // " രാശിചക്രം " , " നവാംശകം " , " ഭാവചക്രം " , " ഭാവ-സന്ധി " ,
    // " പഞ്ചാംഗം " , " ദശാപഹാരം " , " ഷഡ്വർഗം " , " അഷ്ടവർഗം " ,
    // " ത്രിസ് ഫുടാദി " , " ധൂമാദി "];
    // List<String> hinMenuItem=[" जन्म विवर" , " ग्रह स्फुट " , " राशि चक्र "
    // , " नवांश चक्र " , " भाव चलित चक्र " , " भाव संधि स्फुट " ,
    // " पंचांग " , " दशा-अन्तर्दशा " , " षड्वर्ग " , " अष्टक वर्ग " ,
    // " त्रिस्फुटादि " , " धूमादि "];

    List<String> hinMenuItem = [
      "eÉlqÉ ÌuÉuÉU ",
      " aÉëWûxTÑüOû ",
      " UÉÍvÉ cÉ¢ü ",
      " lÉuÉqÉÉÇvÉ ",
      " pÉÉuÉ cÉÍsÉiÉ cÉ¢ü ",
      " pÉÉuÉ xÉÎlkÉ xTÑüOû ",
      " mÉgcÉÉÇaÉ ",
      " SvÉÉ – AliÉSïvÉÉ ",
      " wÉQèuÉaÉï ",
      " A¹MüuÉaÉï ",
      " Ì§ÉxTÑüOûÉÌS ",
      " kÉÔqÉÉÌS"
    ];
    List<String> malMenuItem = [
      "QÁ l¢lj«",
      "±Lpo®e¤T¹w",
      "j¡m¢O±J«",
      "clh¡«m«",
      "g¡l O±J«",
      "g¡l~ oÜ¢",
      "dÕ¡«L«",
      "am¡dp¡j«",
      "nV§tL«",
      "AnéltL«",
      "±Y¢o®e¤T¡a¢",
      "b¥h¡a¢"
    ];

    if (AndroidSDKVersion >= 21) {
      malMenuItem = [
        " ജാതക വിവരം ",
        " ഗ്രഹസ്പുടം ",
        " രാശിചക്രം ",
        " നവാംശകം ",
        " ഭാവചക്രം ",
        " ഭാവ-സന്ധി ",
        " പഞ്ചാംഗം ",
        " ദശാപഹാരം ",
        " ഷഡ്വർഗം ",
        " അഷ്ടവർഗം ",
        " ത്രിസ് ഫുടാദി ",
        " ധൂമാദി "
      ];
    }
    if (type == Language.KANNADA) {
      return kanMenuItem[index];
    } else if (type == Language.ENGLISH) {
      return engMenuItem[index];
    } else if (type == Language.HINDI) {
      return hinMenuItem[index];
    } else {
      return malMenuItem[index];
    }
  }

  List<String> getMenuItemArray() {
    List<String> kanMenuItem = [
      " eÁvÀPÀ «ªÀgÀ ",
      " UÀæºÀ¸ÀÄál ",
      " gÁ² PÀÄAqÀ° ",
      " £ÀªÁA±À PÀÄAqÀ° ",
      " ¨sÁªÀ PÀÄAqÀ° ",
      " ¨sÁªÀ-¸ÀA¢ü ",
      " ¥ÀAZÁAUÀ ",
      " zÀ±Á-¨sÀÄQÛ ",
      " µÀqÀéUÀð ",
      " CµÀÖPÀªÀUÀð ",
      " wæ¸ÀÄámÁ¢ ",
      " zsÀÆªÀiÁ¢ "
    ];
    List<String> engMenuItem = [
      "Basic Details",
      "Planet Info",
      "Rashi Kundli",
      "Navamsha Kundli",
      "Bhava-Kundli",
      "Bhava-Sandhi",
      "Panchanga",
      "Dasha-Bhukti",
      "Shadvarga",
      "Ashtakavarga",
      "Trisphutadi",
      "Dhoomaadi"
    ];
    // /List<String>
    // malMenuItem={"ജാതക വിവരം","ഗ്രഹസ്പുടം","രാശിചക്രം","നവാംശകം","ഭാവചക്രം","ഭാവ-സന്ധി","പഞ്ചാംഗം","ദശാപഹാരം","ഷഡ്വർഗം","അഷ്ടവർഗം","ത്രിസ് ഫുടാദി","ധൂമാദി"};
    // /List<String>
    // hinMenuItem={"जन्म विवर ","ग्रह स्फुट","राशि चक्र","नवांश चक्र","भाव चलित चक्र","भाव संधि स्फुट","पंचांग","दशा-अन्तर्दशा","षड्वर्ग","अष्टक वर्ग","त्रिस्फुटादि","धूमादि"};
    List<String> hinMenuItem = [
      "eÉlqÉ ÌuÉuÉU ",
      " aÉëWûxTÑüOû ",
      " UÉÍvÉ cÉ¢ü ",
      " lÉuÉqÉÉÇvÉ ",
      " pÉÉuÉ cÉÍsÉiÉ cÉ¢ü ",
      " pÉÉuÉ xÉÎlkÉ xTÑüOû ",
      " mÉgcÉÉÇaÉ ",
      " SvÉÉ – AliÉSïvÉÉ ",
      " wÉQèuÉaÉï ",
      " A¹MüuÉaÉï ",
      " Ì§ÉxTÑüOûÉÌS ",
      " kÉÔqÉÉÌS"
    ];

    List<String> malMenuItem = [
      "QÁ l¢lj«",
      "±Lpo®e¤T¹w",
      "j¡m¢O±J«",
      "clh¡«m«",
      "g¡l O±J«",
      "g¡l~ oÜ¢",
      "dÕ¡«L«",
      "am¡dp¡j«",
      "nV§tL«",
      "AnéltL«",
      "±Y¢o®e¤T¡a¢",
      "b¥h¡a¢"
    ];

    if (AndroidSDKVersion >= 21) {
      malMenuItem = [
        "ജാതക വിവരം",
        "ഗ്രഹസ്പുടം",
        "രാശിചക്രം",
        "നവാംശകം",
        "ഭാവചക്രം",
        "ഭാവ-സന്ധി",
        "പഞ്ചാംഗം",
        "ദശാപഹാരം",
        "ഷഡ്വർഗം",
        "അഷ്ടവർഗം",
        "ത്രിസ് ഫുടാദി",
        "ധൂമാദി"
      ];
    }
    if (type == Language.KANNADA) {
      return kanMenuItem;
    } else if (type == Language.ENGLISH) {
      return engMenuItem;
    } else if (type == Language.HINDI) {
      return hinMenuItem;
    } else {
      return malMenuItem;
    }
  }

  String getSuklaPakshaValue() {
    String engValue = "Sukla Paksha";
    String kanValue = "±ÀÄPÀè¥ÀPÀë";
    // String malValue="ശുക്ലപക്ഷം" ;
    // String hinValue="शुक्लपक्ष";
    String malValue = "m¤JëdÈ«";
    String hinValue = "vÉÑYsÉ mÉ¤É";

    if (AndroidSDKVersion >= 21) {
      malValue = "ശുക്ലപക്ഷം";
    }

    if (type == Language.KANNADA) {
      return kanValue;
    } else if (type == Language.ENGLISH) {
      return engValue;
    } else if (type == Language.HINDI) {
      return hinValue;
    } else {
      return malValue;
    }
  }

  String getKrishnaPakshaValue() {
    String engValue = "Krishna Paksha";
    String kanValue = "PÀÈµÀÚ¥ÀPÀë";
    // String hinValue = "कृष्णपक्ष";
    // String malValue = "കൃഷ്ണപക്ഷം";
    String hinValue = "M×üwhÉ mÉ¤É";
    String malValue = "J¦nådÈ«";

    if (AndroidSDKVersion >= 21) {
      malValue = "കൃഷ്ണപക്ഷം";
    }

    if (type == Language.KANNADA) {
      return kanValue;
    } else if (type == Language.ENGLISH) {
      return engValue;
    } else if (type == Language.HINDI) {
      return hinValue;
    } else {
      return malValue;
    }
  }

  // Get thithi array value
  String getThithiValue(int index) {
    List<String> engThithiArr = [
      "Pratipat",
      "Dviteeya",
      "Triteeya",
      "Chaturthi",
      "Panchami",
      "Shashthi",
      "Sapthami",
      "Ashtami",
      "Navami",
      "Dasami",
      "Ekadasi",
      "Dvadasi",
      "Trayodasi",
      "Chaturdasi",
      "Poornima",
      "Pratipat",
      "Dviteeya",
      "Triteeya",
      "Chaturthi",
      "Panchami",
      "Shashthi",
      "Sapthami",
      "Ashtami",
      "Navami",
      "Dasami",
      "Ekadasi",
      "Dvadasi",
      "Trayodasi",
      "Chaturdasi",
      "Amavasya"
    ];
    List<String> kanThithiArr = [
      "¥Àæw¥Àvï",
      "¢éwÃ0iÀiÁ",
      "vÀÈwÃ0iÀiÁ",
      "ZÀvÀÄyð",
      "¥ÀAZÀ«Ä",
      "µÀ¶×",
      "¸À¥ÀÛ«Ä",
      "CµÀÖ«Ä",
      "£ÀªÀ«Ä",
      "zÀ±À«Ä",
      "KPÁzÀ²",
      "zÁézÀ²",
      "vÀæ0iÉÆÃzÀ²",
      "ZÀvÀÄzÀð²",
      "¥Ëtð«Ä",
      "¥Àæw¥Àvï",
      "¢éwÃ0iÀiÁ",
      "vÀÈwÃ0iÀiÁ",
      "ZÀvÀÄyð",
      "¥ÀAZÀ«Ä",
      "µÀ¶×",
      "¸À¥ÀÛ«Ä",
      "CµÀÖ«Ä",
      "£ÀªÀ«Ä",
      "zÀ±À«Ä",
      "KPÁzÀ²",
      "zÁézÀ²",
      "vÀæ0iÉÆÃzÀ²",
      "ZÀvÀÄzÀð²",
      "CªÀiÁªÁ¸Éå"
    ];
    // List<String>
    // malThithiArr={"പ്രതിപത്","ദ്വിതീയാ","തൃതീയാ","ചതുര്ഥി","പഞ്ചമി","ഷഷ്ഠി","സപ്തമി","അഷ്ടമി","നവമി","ദശമി","ഏകാദശി","ദ്വാദശി","ത്രയോദശി","ചതുര്ദശി","പൌര്ണമാസി","പ്രതിപത്","ദ്വിതീയാ","തൃതീയാ","ചതുര്ഥി","പഞ്ചമി","ഷഷ്ഠി","സപ്തമി","അഷ്ടമി","നവമി","ദശമി","ഏകാദശി","ദ്വാദശി","ത്രയോദശി","ചതുര്ദശി","അമാവാസി"};
    // List<String>
    // hinThithiArr={"प्रतिपत","द्वितीया","तृतीया","चतुर्थी","पंचमी","षष्ठी","सप्तमी","अष्टमी","नवमी","दशमी","एकादशी","द्वादशी","त्रयोदशी","चतुर्दशी","पूर्णिमा","प्रतिपत","द्वितीया","तृतीया","चतुर्थी","पंचमी","षष्ठी","सप्तमी","अष्टमी","नवमी","दशमी","एकादशी","द्वादशी","त्रयोदशी","चतुर्दशी","अमावास्या"};
    List<String> hinThithiArr = [
      "mÉëÌiÉmÉiÉç",
      "Ì²iÉÏrÉÉ",
      "iÉ×iÉÏrÉÉ",
      "cÉiÉÑÍjÉï",
      "mÉgcÉÍqÉ",
      "wÉÌ¸",
      "xÉmiÉÍqÉ",
      "A¹ÍqÉ",
      "lÉuÉÍqÉ",
      "SvÉÍqÉ",
      "LãMüÉSÍvÉ",
      "²ÉSÍvÉ",
      "§ÉrÉÉãSÍvÉ",
      "cÉiÉÑSïÍvÉ",
      "mÉÔÍhÉïqÉÉ",
      "mÉëÌiÉmÉiÉç",
      "Ì²iÉÏrÉÉ",
      "iÉ×iÉÏrÉÉ",
      "cÉiÉÑÍjÉï",
      "mÉgcÉÍqÉ",
      "wÉÌ¸",
      "xÉmiÉÍqÉ",
      "A¹ÍqÉ",
      "lÉuÉÍqÉ",
      "SvÉÍqÉ",
      "LãMüÉSÍvÉ",
      "²ÉSÍvÉ",
      "§ÉrÉÉãSÍvÉ",
      "cÉiÉÑSïÍvÉ",
      "AqÉÉuÉÉxrÉÉ"
    ];
    List<String> malThithiArr = [
      "±dY¢dY®",
      "a§¢Y£i¡",
      "Y¦Y£i¡",
      "OY¤tZ£",
      "dÕh¢",
      "nn®U¢",
      "odíh¢",
      "Anéh¢",
      "clh¢",
      "amh¢",
      "GJ¡am¢",
      "a§¡am¢",
      "±Y©i¡am¢",
      "OY¤tam¢",
      "dªtXh¡o¢",
      "±dY¢dY®",
      "a§¢Y£i¡",
      "Y¦Y£i¡",
      "OY¤tZ£",
      "dÕh¢",
      "nn®U¢",
      "odíh¢",
      "Anéh¢",
      "clh¢",
      "amh¢",
      "GJ¡am¢",
      "a§¡am¢",
      "±Y©i¡am¢",
      "OY¤tam¢",
      "Ah¡l¡o¢"
    ];

    if (AndroidSDKVersion >= 21) {
      malThithiArr = [
        "പ്രതിപത്",
        "ദ്വിതീയാ",
        "തൃതീയാ",
        "ചതുര്ഥി",
        "പഞ്ചമി",
        "ഷഷ്ഠി",
        "സപ്തമി",
        "അഷ്ടമി",
        "നവമി",
        "ദശമി",
        "ഏകാദശി",
        "ദ്വാദശി",
        "ത്രയോദശി",
        "ചതുര്ദശി",
        "പൌര്ണമാസി",
        "പ്രതിപത്",
        "ദ്വിതീയാ",
        "തൃതീയാ",
        "ചതുര്ഥി",
        "പഞ്ചമി",
        "ഷഷ്ഠി",
        "സപ്തമി",
        "അഷ്ടമി",
        "നവമി",
        "ദശമി",
        "ഏകാദശി",
        "ദ്വാദശി",
        "ത്രയോദശി",
        "ചതുര്ദശി",
        "അമാവാസി"
      ];
    }

    if (type == Language.KANNADA) {
      return kanThithiArr[index];
    } else if (type == Language.ENGLISH) {
      return engThithiArr[index];
    } else if (type == Language.HINDI) {
      return hinThithiArr[index];
    } else {
      return malThithiArr[index];
    }
  }

  // Year array
  String getYearArrayValue(int index) {
    List<String> engYearArr = ["years", "months", "days"];
    // List<String> malYearArr = {"വര്ഷം ","മാസം","ദിനം"};
    // List<String> hinYearArr = {"साल","महीना","दिवस"};
    List<String> kanYearArr = ["ªÀµÀð", "ªÀiÁ¸À", "¢£À"];
    List<String> hinYearArr = ["xÉÉsÉ", "qÉWûÏlÉÉ", "ÌSuÉxÉ"];
    List<String> malYearArr = ["ltn«", "h¡o«", "a¢lo«"];

    if (AndroidSDKVersion >= 21) {
      malYearArr = ["വര്ഷം ", "മാസം", "ദിനം"];
    }

    if (type == Language.KANNADA) {
      return kanYearArr[index];
    } else if (type == Language.ENGLISH) {
      return engYearArr[index];
    } else if (type == Language.HINDI) {
      return hinYearArr[index];
    } else {
      return malYearArr[index];
    }
  }

  // Dasa lord array
  String getDasaLordArray(int index) {
    // Dasa lord array
    List<String> engDasaLordArr = [
      "Ketu",
      "Sukr",
      "Ravi",
      "Chan",
      "Kuja",
      "Rahu",
      "Guru",
      "Sani",
      "Budh"
    ];
    List<String> kanDasaLordArr = [
      "PÉÃvÀÄ",
      "±ÀÄPÀæ",
      "gÀ«",
      "ZÀAzÀæ",
      "PÀÄd",
      "gÁºÀÄ",
      "UÀÄgÀÄ",
      "±À¤",
      "§ÄzsÀ"
    ];
    // List<String>
    // hinDasaLordArr={"केतु","शुक्र","रवि","चन्द्र","मंगल","राहु","गुरु","शनि","बुध"};
    // List<String>
    // malDasaLordArr={"കേതു","ശുക്ര","രവി","ചന്ദ്ര","കുജ","രാഹു","ഗുരു","ശനി","ബുധ"};
    List<String> hinDasaLordArr = [
      "MãüiÉÑ",
      "vÉÑ¢ü",
      "UÌuÉ",
      "cÉlSì",
      "qÉÇaÉsÉ",
      "UÉWÒû",
      "aÉÑÂ",
      "vÉÌlÉ",
      "oÉÑkÉ"
    ];
    List<String> malDasaLordArr = [
      "©JY¤",
      "m¤±J",
      "jl¢",
      "O±z",
      "J¤Q",
      "j¡p¤",
      "L¤y",
      "mc¢",
      "f¤b"
    ];

    if (AndroidSDKVersion >= 21) {
      malDasaLordArr = [
        "കേതു",
        "ശുക്ര",
        "രവി",
        "ചന്ദ്ര",
        "കുജ",
        "രാഹു",
        "ഗുരു",
        "ശനി",
        "ബുധ"
      ];
    }

    if (type == Language.KANNADA) {
      return kanDasaLordArr[index];
    } else if (type == Language.ENGLISH) {
      return engDasaLordArr[index];
    } else if (type == Language.HINDI) {
      return hinDasaLordArr[index];
    } else {
      return malDasaLordArr[index];
    }
  }

  String getAdhipatiArrayValue(int index) {
    // Adhipati array
    List<String> engAdhipathiArr = [
      "Kj",
      "Sk",
      "Bd",
      "Ch",
      "Rv",
      "Bd",
      "Sk",
      "Kj",
      "Gr",
      "Sn",
      "Sn",
      "Gr"
    ];
    List<String> kanAdhipathiArr = [
      "PÀÄ",
      "±ÀÄ",
      "§Ä",
      "ZÀ",
      "gÀ",
      "§Ä",
      "±ÀÄ",
      "PÀÄ",
      "UÀÄ",
      "±À",
      "±À",
      "UÀÄ"
    ];
    // /List<String>
    // hinAdhipathiArr={"मं","शु","बु","च","र","बु","शु","मं","गु","श","श","गु"};
    // List<String>
    // malAdhipathiArr={"കു","ശു","ബു","ച","ര","ബു","ശു","കു","ഗു","മ","മ","ഗു"};
    List<String> hinAdhipathiArr = [
      "qÉÇ",
      "vÉÑ",
      "oÉÑ",
      "cÉ",
      "U",
      "oÉÑ",
      "vÉÑ",
      "qÉÇ",
      "aÉÑ",
      "vÉ",
      "vÉ",
      "aÉÑ"
    ];
    List<String> malAdhipathiArr = [
      "J¤",
      "m¤",
      "f¤",
      "O",
      "j",
      "f¤",
      "m¤",
      "J¤",
      "L¤",
      "h",
      "h",
      "L¤"
    ];

    if (AndroidSDKVersion >= 21) {
      malAdhipathiArr = [
        "കു",
        "ശു",
        "ബു",
        "ച",
        "ര",
        "ബു",
        "ശു",
        "കു",
        "ഗു",
        "മ",
        "മ",
        "ഗു"
      ];
    }
    if (type == Language.KANNADA) {
      return kanAdhipathiArr[index];
    } else if (type == Language.ENGLISH) {
      return engAdhipathiArr[index];
    } else if (type == Language.HINDI) {
      return hinAdhipathiArr[index];
    } else {
      return malAdhipathiArr[index];
    }
  }

  List<String> getGrahaSputhaHeadingArray() {
    List<String> engPlanetInfo = ["planet", "longitude", "nakshatra", "pada"];

    return engPlanetInfo;
  }

  List<String> getAshtakaVargaHeadingArray() {
    // TODO Auto-generated method stub
    List<String> engAshtakavargaHeadingArr = [
      "Rasi",
      "Rv",
      "Ch",
      "Kj",
      "Bd",
      "Gr",
      "Sk",
      "Sn",
      "Sarv"
    ];

    return engAshtakavargaHeadingArr;
  }

  List<String> getShadvargaHeadingArray() {
    // TODO Auto-generated method stub
    List<String> engShadvargaHeadingArr = [
      "Graha",
      "Dre",
      "Hor",
      "Nav",
      "Tri",
      "Dwa",
      "Ksh"
    ];
    List<String> kanShadvargaHeadingArr = [
      "UÀæºÀ",
      "zÉæÃ",
      "ºÉÆÃ",
      "£À",
      "wæA",
      "zÁé",
      "PÉëÃ"
    ];
    // List<String> hinShadvargaHeadingArr = {"ग्रह","द्रे","हो","नव","त्रिं",
    // "द्वा","क्षे"};
    // List<String> malShadvargaHeadingArr =
    // {"ഗ്രഹം","ദ്രേ","ഹോ","ന","ത്രിം","ദ്വാ","ക്ഷേ"};
    List<String> hinShadvargaHeadingArr = [
      "aÉëWû",
      "Sìã",
      "WûÉã",
      "lÉ",
      "Ì§ÉÇ",
      "²É",
      "¤Éã"
    ];

    List<String> malShadvargaHeadingArr = [
      "Lp«",
      "©±a",
      "©p¡",
      "c",
      "±Y¢«",
      "a§¡",
      "©È"
    ];

    if (AndroidSDKVersion >= 21) {
      malShadvargaHeadingArr = [
        "ഗ്രഹം",
        "ദ്രേ",
        "ഹോ",
        "ന",
        "ത്രിം",
        "ദ്വാ",
        "ക്ഷേ"
      ];
    }
    if (type == Language.KANNADA) {
      return kanShadvargaHeadingArr;
    } else if (type == Language.ENGLISH) {
      return engShadvargaHeadingArr;
    } else if (type == Language.HINDI) {
      return hinShadvargaHeadingArr;
    } else {
      return malShadvargaHeadingArr;
    }
  }

  List<String> getPanchangaArray() {
    List<String> engPanchangaArray = [
      "Thithi :",
      "Vaara :",
      "Nakshatra :",
      "Yoga :",
      "Karana :",
      "Nak.Gatha :",
      "Balance Dasa :"
    ];
    List<String> kanPanchangaArray = [
      "wy :",
      "ªÁgÀ :",
      "£ÀPÀëvÀæ :",
      "AiÉÆÃUÀ :",
      "PÀgÀt :",
      "£ÀPÀëvÀæ UÀvÀ :",
      "d£Àä ²µÀÖ zÀ±Á :"
    ];
    // List<String>
    // hinPanchangaArray={"तिथि :","वार :","नक्षत्र :","योग :","करण :","नक्षत्र गत :","जन्म शिष्ट दशा :"};
    // List<String>
    // malPanchangaArray={"തിഥി :","ആഴ്ച :","നക്ഷത്രം :","നിത്യയോഗം  :","കരണം :","നക്ഷത്രഗതം :","ജന്മശിഷ്ട ദശാ :"};
    List<String> hinPanchangaArray = [
      "ÌiÉÍjÉ :",
      "uÉÉU :",
      "lÉ¤É§É :",
      "rÉÉãaÉ :",
      "MüUhÉ :",
      "lÉ¤É§É aÉiÉ :",
      "eÉlqÉ, ÍvÉ¹ SvÉÉ :"
    ];
    List<String> malPanchangaArray = [
      "Y¢Z¢ :",
      "Br®O :",
      "cÈ±Y« :",
      "c¢Y¬©i¡L« :",
      "JjX« :",
      "cÈ±YLY« :",
      "QÁ m¢né am¡ :"
    ];

    if (AndroidSDKVersion >= 21) {
      malPanchangaArray = [
        "തിഥി :",
        "ആഴ്ച :",
        "നക്ഷത്രം :",
        "നിത്യയോഗം  :",
        "കരണം :",
        "നക്ഷത്രഗതം :",
        "ജന്മശിഷ്ട ദശാ :"
      ];
    }
    if (type == Language.KANNADA) {
      return kanPanchangaArray;
    } else if (type == Language.ENGLISH) {
      return engPanchangaArray;
    } else if (type == Language.HINDI) {
      return hinPanchangaArray;
    } else {
      return malPanchangaArray;
    }
  }

  String getTrisphutadiArrayValue(int index) {
    List<String> engTrisphutadiArray = [
      "Trisphuta",
      "Chatusphuta",
      "Panchasphuta",
      "Pranasphuta",
      "Dehasphuta",
      "MrityuSphuta",
      "SookshmaTrisphuta"
    ];
    List<String> kanTrisphutadiArray = [
      "wæ",
      "ÀÄál",
      "ZÀvÀÄ¸ÀÄál",
      "¥ÀAZÀ¸ÀÄál",
      "¥Áæt¸ÀÄál",
      "zÉÃºÀ¸ÀÄál",
      "ªÀÄÈvÀÄå¸ÀÄál",
      "¸ÀÆ.wæ¸ÀÄál"
    ];
    // List<String>
    // hinTrisphutadiArray={"त्रिस्फुट","चतुस्फुट","पञ्चस्फुट","प्राणस्फुट","देहस्फुट","मृत्युस्फुट","सूक्ष्मत्रिस्फुट"};
    // List<String>
    // malTrisphutadiArray={"ത്രിസ്ഫുടം","ചതുസ്ഫുടം","പഞ്ചസ്ഫുടം","പ്രാണസ്ഫുടം","ദേഹസ്ഫുടം","മൃത്യുസ്ഫുടം","സൂക്ഷ്മത്രിസ്ഫുടം"};
    List<String> hinTrisphutadiArray = [
      "Ì§ÉxTÑüOû",
      "cÉiÉÑxTÑüOû",
      "mÉgcÉxTÑüOû",
      "mÉëÉhÉxTÑüOû",
      "SãWûxTÑüOû",
      "qÉ×irÉÑxTÑüOû",
      "xÉÔ¤qÉÌ§ÉxTÑüOû"
    ];
    List<String> malTrisphutadiArray = [
      "±Y¢o®e¤T«",
      "O×¤o®e¤T«",
      "dÕo®e¤T«",
      "±d¡Xo®e¤T«",
      "©apo®e¤T«",
      "±h¤Y¬¤o®e¤T«",
      "o¥Èä±Y¢o®e¤T«"
    ];

    if (AndroidSDKVersion >= 21) {
      malTrisphutadiArray = [
        "ത്രിസ്ഫുടം",
        "ചതുസ്ഫുടം",
        "പഞ്ചസ്ഫുടം",
        "പ്രാണസ്ഫുടം",
        "ദേഹസ്ഫുടം",
        "മൃത്യുസ്ഫുടം",
        "സൂക്ഷ്മത്രിസ്ഫുടം"
      ];
    }
    if (type == Language.KANNADA) {
      return kanTrisphutadiArray[index];
    } else if (type == Language.ENGLISH) {
      return engTrisphutadiArray[index];
    } else if (type == Language.HINDI) {
      return hinTrisphutadiArray[index];
    } else {
      return malTrisphutadiArray[index];
    }
  }

  List<String> getTrisphutadiArray() {
    List<String> engTrisphutadiArray = [
      "Trisphuta",
      "Chatusphuta",
      "Panchasphuta",
      "PranaSphuta",
      "DehaSphuta",
      "MrityuSphuta",
      "SookshmaTrisphuta"
    ];
    List<String> kanTrisphutadiArray = [
      "wæ¸ÀÄál",
      "ZÀvÀÄ¸ÀÄál",
      "¥ÀAZÀ¸ÀÄál",
      "¥Áæt¸ÀÄál",
      "zÉÃºÀ¸ÀÄál",
      "ªÀÄÈvÀÄå¸ÀÄál",
      "¸ÀÆ.wæ¸ÀÄál"
    ];
    // List<String>
    // hinTrisphutadiArray={"त्रिस्फुट","चतुस्फुट","पञ्च स्फुट","प्राणस्फुट","देहस्फुट","मृत्यु स्फुट","सूक्ष्म त्रिस्फुट"};
    // List<String>
    // malTrisphutadiArray={"ത്രിസ്ഫുടം","ചതുസ്ഫുടം","പഞ്ചസ്ഫുടം","പ്രാണസ്ഫുടം","ദേഹസ്ഫുടം","മൃത്യുസ്ഫുടം","സൂക്ഷ്മത്രിസ്ഫുടം"};
    List<String> hinTrisphutadiArray = [
      "Ì§ÉxTÑüOû",
      "cÉiÉÑxTÑüOû",
      "mÉgcÉxTÑüOû",
      "mÉëÉhÉxTÑüOû",
      "SãWûxTÑüOû",
      "qÉ×irÉÑxTÑüOû",
      "xÉÔ¤qÉÌ§ÉxTÑüOû"
    ];
    List<String> malTrisphutadiArray = [
      "±Y¢o®e¤T«",
      "O×¤o®e¤T«",
      "dÕo®e¤T«",
      "±d¡Xo®e¤T«",
      "©apo®e¤T«",
      "±h¤Y¬¤o®e¤T«",
      "o¥Èä±Y¢o®e¤T«"
    ];

    if (AndroidSDKVersion >= 21) {
      malTrisphutadiArray = [
        "ത്രിസ്ഫുടം",
        "ചതുസ്ഫുടം",
        "പഞ്ചസ്ഫുടം",
        "പ്രാണസ്ഫുടം",
        "ദേഹസ്ഫുടം",
        "മൃത്യുസ്ഫുടം",
        "സൂക്ഷ്മത്രിസ്ഫുടം"
      ];
    }

    if (type == Language.KANNADA) {
      return kanTrisphutadiArray;
    } else if (type == Language.ENGLISH) {
      return engTrisphutadiArray;
    } else if (type == Language.HINDI) {
      return hinTrisphutadiArray;
    } else {
      return malTrisphutadiArray;
    }
  }

  List<String> getDhoomadiArray() {
    List<String> engDhoomadiArray = [
      "Dhooma",
      "Vyatipata",
      "Parivesha",
      "Indrachapa",
      "Upaketu"
    ];
    List<String> kanDhoomadiArray = [
      "zsÀÆªÀÄ",
      "ªÀåwÃ¥ÁvÀ",
      "¥ÀjªÉÃµÀ",
      "EAzÀæZÁ¥À",
      "G¥ÀPÉÃvÀÄ"
    ];
    // List<String> malDhoomadiArray =
    // {"ധൂമം","വ്യതീപാതം","പരിവേഷം","ഇന്ദ്രചാപം","ഉപകേതു"};
    // List<String> hinDhoomadiArray =
    // {"धूम","व्यतीपात","परिवेष","इन्द्रचाप","उपकेतु"};
    List<String> hinDhoomadiArray = [
      "kÉÔqÉ",
      "urÉiÉÏmÉÉiÉ",
      "mÉËUuÉãwÉ",
      "ClSìcÉÉmÉ",
      "EmÉMãüiÉÑ"
    ];
    List<String> malDhoomadiArray = [
      "b¥h",
      "l¬Y£d¡Y",
      "dj¢©ln",
      "C±zO¡d",
      "Dd©JY¤"
    ];

    if (AndroidSDKVersion >= 21) {
      malDhoomadiArray = [
        "ധൂമം",
        "വ്യതീപാതം",
        "പരിവേഷം",
        "ഇന്ദ്രചാപം",
        "ഉപകേതു"
      ];
    }
    if (type == Language.KANNADA) {
      return kanDhoomadiArray;
    } else if (type == Language.ENGLISH) {
      return engDhoomadiArray;
    } else if (type == Language.HINDI) {
      return hinDhoomadiArray;
    } else {
      return malDhoomadiArray;
    }
  }

  String getDhoomadiArrayValue(int index) {
    List<String> engDhoomadiArray = [
      "Dhooma",
      "Vyatipata",
      "Parivesha",
      "Indrachapa",
      "Upaketu"
    ];
    List<String> kanDhoomadiArray = [
      "zsÀÆªÀÄ",
      "ªÀåwÃ¥ÁvÀ",
      "¥ÀjªÉÃµÀ",
      "EAzÀæZÁ¥À",
      "G¥ÀPÉÃvÀÄ"
    ];
    // List<String> malDhoomadiArray =
    // {"ധൂമം","വ്യതീപാതം","പരിവേഷം","ഇന്ദ്രചാപം","ഉപകേതു"};
    // List<String> hinDhoomadiArray =
    // {"धूम","व्यतीपात","परिवेष","इन्द्रचाप","उपकेतु"};
    List<String> hinDhoomadiArray = [
      "kÉÔqÉ",
      "urÉiÉÏmÉÉiÉ",
      "mÉËUuÉãwÉ",
      "ClSìcÉÉmÉ",
      "EmÉMãüiÉÑ"
    ];
    List<String> malDhoomadiArray = [
      "b¥h",
      "l¬Y£d¡Y",
      "dj¢©ln",
      "C±zO¡d",
      "Dd©JY¤"
    ];

    if (AndroidSDKVersion >= 21) {
      malDhoomadiArray = [
        "ധൂമം",
        "വ്യതീപാതം",
        "പരിവേഷം",
        "ഇന്ദ്രചാപം",
        "ഉപകേതു"
      ];
    }

    if (type == Language.KANNADA) {
      return kanDhoomadiArray[index];
    } else if (type == Language.ENGLISH) {
      return engDhoomadiArray[index];
    } else if (type == Language.HINDI) {
      return hinDhoomadiArray[index];
    } else {
      return malDhoomadiArray[index];
    }
  }

  List<String> getBhavasandhiHeadingArray() {
    List<String> kanBhavasandhiArr = ["¨sÁªÀ", "¨sÁªÀªÀÄzsÀå", "¨sÁªÁAvÀå"];
    List<String> engBhavasandhiArr = ["Bhava", "Madhya", "Anthya"];
    // List<String> hinBhavasandhiArr = {"भाव","भावमध्य","भावान्त्य"};
    // /List<String> malBhavasandhiArr = {"ഭാവം","ഭാവമധ്യം","ഭാവാന്ത്യം"};
    List<String> hinBhavasandhiArr = ["pÉÉuÉ", "pÉÉuÉqÉkrÉ", "pÉÉuÉÉlirÉ"];
    List<String> malBhavasandhiArr = ["g¡l«", "g¡lhb¬«", "g¡l¡É¬«"];

    if (AndroidSDKVersion >= 21) {
      malBhavasandhiArr = ["ഭാവം", "ഭാവമധ്യം", "ഭാവാന്ത്യം"];
    }
    if (type == Language.KANNADA) {
      return kanBhavasandhiArr;
    } else if (type == Language.ENGLISH) {
      return engBhavasandhiArr;
    } else if (type == Language.HINDI) {
      return hinBhavasandhiArr;
    } else {
      return malBhavasandhiArr;
    }
  }

  List<String> getBasicDetailArray() {
    List<String> kanBasicDetailArr = [
      "ºÉ¸ÀgÀÄ :",
      "¢£ÁAPÀ :",
      "¸ÀªÀÄ0iÀÄ :",
      "d£Àä¸ÀÜ¼À :",
      "CPÁëA±À :",
      "gÉÃSÁA±À :",
      "PÀ°¢£À :",
      "¸ÀÆ0iÉÆðÃzÀ0iÀÄ :",
      "¸ÀÆ0iÀiÁð¸ÀÛ :",
      "GzÀ0iÀiÁ¢ :"
    ];
    List<String> engBasicDetailArr = [
      "Name :",
      "Date :",
      "Time :",
      "Place :",
      "Latitude :",
      "Longtitude :",
      "Kalidina :",
      "SunRise :",
      "SunSet :",
      "Udayadi :"
    ];
    // List<String> hinBasicDetailArr =
    // {"नाम :","जन्मदिन :","समय :","जन्मस्थल :","अक्षांश :","रेखांश :","कलिदिन :","सूर्योदय :","सूर्यास्त :","उदयादी घटी :"};
    // List<String> malBasicDetailArr =
    // {"പേര് :","ജന്മ തിയ്യതി :","സമയം :","ജന്മസ്ഥലം :","അക്ഷാംശം :","രേഖാംശം :","കലിദിനം :","സൂര്യോദയം :","സൂര്യാസ്തം :","ഉദയാദി :"};
    List<String> hinBasicDetailArr = [
      "lÉÉqÉ :",
      "eÉlqÉÌSlÉ :",
      "xÉqÉrÉ :",
      "eÉlqÉxjÉsÉ :",
      "A¤ÉÉÇvÉ :",
      "UãZÉÉÇvÉ :",
      "MüÍsÉÌSlÉ :",
      "xÉÔrÉÉãïSrÉ :",
      "xÉÔrÉÉïxiÉ :",
      "ESrÉÉÌS :"
    ];
    List<String> malBasicDetailArr = [
      "©dt :",
      "QÁa¢c« :",
      "ohi« :",
      "Ìk« :",
      "AÈ¡«m« :",
      "©jK¡«m« :",
      "Jk¢a¢c« :",
      "o¥©j¬¡ai« :",
      "Aoíhc« :",
      "Dai¡a¢ :"
    ];

    if (AndroidSDKVersion >= 21) {
      malBasicDetailArr = [
        "പേര് :",
        "ജന്മ തിയ്യതി :",
        "സമയം :",
        "ജന്മസ്ഥലം :",
        "അക്ഷാംശം :",
        "രേഖാംശം :",
        "കലിദിനം :",
        "സൂര്യോദയം :",
        "സൂര്യാസ്തം :",
        "ഉദയാദി :"
      ];
    }
    if (type == Language.KANNADA) {
      return kanBasicDetailArr;
    } else if (type == Language.ENGLISH) {
      return engBasicDetailArr;
    } else if (type == Language.HINDI) {
      return hinBasicDetailArr;
    } else {
      return malBasicDetailArr;
    }
  }

  String getKundliLabel(int index) {
    List<String> kanKundliLabel = ["ºÉ¸ÀgÀÄ :", "¢£ÁAPÀ :", "£ÀPÀëvÀæ :"];
    List<String> engKundliLabel = ["Name :", "Date :", "Nakshatra :"];
    // List<String> hinKundliLabel = {"नाम :","ജന്മ തിയ്യതി :","lÉ¤É§É :"};
    // List<String> malKundliLabel = {"പേര് :","ജന്മ തിയ്യതി :","നക്ഷത്രം :"};
    List<String> hinKundliLabel = ["lÉÉqÉ :", "eÉlqÉÌSlÉ :", "lÉ¤É§É :"];
    List<String> malKundliLabel = ["©dt :", "QÁa¢c« :", "cÈ±Y« :"];

    if (AndroidSDKVersion >= 21) {
      malKundliLabel = ["പേര് :", "ജന്മ തിയ്യതി :", "നക്ഷത്രം :"];
    }
    if (type == Language.KANNADA) {
      return kanKundliLabel[index];
    } else if (type == Language.ENGLISH) {
      return engKundliLabel[index];
    } else if (type == Language.HINDI) {
      return hinKundliLabel[index];
    } else {
      return malKundliLabel[index];
    }
  }

  String getPrashnaKundliLabel(int index) {
    List<String> kanKundliLabel = [
      "¢£ÁAPÀ :",
      "¸ÀªÀÄ0iÀÄ :",
      "d£Àä¸ÀÜ¼À :",
      "£ÀPÀëvÀæ :"
    ];
    List<String> engKundliLabel = [
      "Date :",
      "Time :",
      "Place :",
      "Nakshatra :"
    ];
    // List<String> hinKundliLabel =
    // {"जन्मदिन :","समय :","जन्मस्थल :","नक्षत्र :"};
    // List<String> malKundliLabel =
    // {"ജന്മ തിയ്യതി :","നക്ഷത്രം :","സമയം :","ജന്മസ്ഥലം :"};
    List<String> malKundliLabel = ["©dt :", "QÁa¢c« :", "Ìk« :", "cÈ±Y« :"];
    List<String> hinKundliLabel = [
      "eÉlqÉÌSlÉ :",
      "xÉqÉrÉ :",
      "eÉlqÉxjÉsÉ :",
      "lÉ¤É§É :"
    ];

    if (AndroidSDKVersion >= 21) {
      malKundliLabel = [
        "ജന്മ തിയ്യതി :",
        "നക്ഷത്രം :",
        "സമയം :",
        "ജന്മസ്ഥലം :"
      ];
    }
    if (type == Language.KANNADA) {
      return kanKundliLabel[index];
    } else if (type == Language.ENGLISH) {
      return engKundliLabel[index];
    } else if (type == Language.HINDI) {
      return hinKundliLabel[index];
    } else {
      return malKundliLabel[index];
    }
  }
}
