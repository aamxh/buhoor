import 'package:flutter/material.dart';

class MyConstants {

  MyConstants._();

  static final grey = Colors.grey;
  static final lightGrey = Colors.grey[200];
  static final darkGrey = Colors.grey[800];
  static final errorColor = Color(0xffb02727);
  static final baseUrl = 'http://10.0.2.2:8000/';
  static const eras = [
    {
      "id": 1,
      "name": "إسلامي",
      "slug": "islamic"
    },
    {
      "id": 4,
      "name": "أموي",
      "slug": "umayyad"
    },
    {
      "id": 5,
      "name": "جاهلي",
      "slug": "jahili"
    },
    {
      "id": 6,
      "name": "مخضرم",
      "slug": "mukhadram"
    },
    {
      "id": 7,
      "name": "أندلسي",
      "slug": "andalusian"
    },
    {
      "id": 9,
      "name": "عثماني",
      "slug": "ottoman"
    },
    {
      "id": 10,
      "name": "أيوبي",
      "slug": "ayyubi"
    },
    {
      "id": 3,
      "name": "متأخر",
      "slug": "late"
    },
    {
      "id": 2,
      "name": "عباسي",
      "slug": "abbasi"
    },
    {
      "id": 8,
      "name": "مملوكي",
      "slug": "mamluk"
    }
  ];

  static const genres = [
    {
      "id": 1,
      "name": "دينية",
      "slug": "f2668136-60ce-4e37-b1e7-9efb84b3eade"
    },
    {
      "id": 2,
      "name": "عتاب",
      "slug": "0a5db87f-f102-4dc0-be02-7204b2dd5f47"
    },
    {
      "id": 3,
      "name": "عدل",
      "slug": "59887034-936a-4e8d-924c-aece9b0d8001"
    },
    {
      "id": 4,
      "name": "هجاء",
      "slug": "a195a7b7-e47f-4f85-a39a-ebb919b16145"
    },
    {
      "id": 5,
      "name": "اعتذار",
      "slug": "29cd60d0-3de7-4539-9e66-9b3faf928beb"
    },
    {
      "id": 7,
      "name": "ذم",
      "slug": "90442bec-71c4-46cc-b6e8-79dff1d4c2e7"
    },
    {
      "id": 9,
      "name": "من",
      "slug": "abc955a5-085d-4045-a001-bfa008d10197"
    },
    {
      "id": 10,
      "name": "ابتهال",
      "slug": "f5fd95d2-43e9-4c19-867a-c12772a090c5"
    },
    {
      "id": 11,
      "name": "شوق",
      "slug": "04afc4ca-8425-4cef-880c-ee4be69faa58"
    },
    {
      "id": 13,
      "name": "فراق",
      "slug": "aaed07ec-07d1-4158-b799-4fe041228b72"
    },
    {
      "id": 14,
      "name": "سياسية",
      "slug": "9e68c8ef-29b5-42c5-8bb1-3ffe80372491"
    },
    {
      "id": 15,
      "name": "جود",
      "slug": "76add93c-9c1e-4e0d-aefc-6372adbc0070"
    },
    {
      "id": 17,
      "name": "غزل",
      "slug": "61a2570d-9acc-493d-a05d-7dd2404c17ff"
    },
    {
      "id": 18,
      "name": "مدح",
      "slug": "f7e0d002-1b82-44b8-8256-91729b24a8fb"
    },
    {
      "id": 19,
      "name": "رثاء",
      "slug": "517490a6-22b5-4877-a1fc-92eacdebd002"
    },
    {
      "id": 20,
      "name": "نصيحة",
      "slug": "4d3b7130-376d-4b5b-bf1c-84dd2317cebb"
    },
    {
      "id": 22,
      "name": "رحمة",
      "slug": "eea24558-4ac5-4eb4-abd7-922dc2d922b2"
    },
    {
      "id": 23,
      "name": "حكمة",
      "slug": "99c86aa0-1547-4b44-869a-7b2a6f2bed80"
    },
    {
      "id": 26,
      "name": "صبر",
      "slug": "bc8d1beb-4a78-4a63-9c04-4215a33a3b70"
    },
    {
      "id": 8,
      "name": "غير مصنف",
      "slug": "cd60fc23-6734-4b2d-a7b7-a11c57ba07f6"
    },
    {
      "id": 6,
      "name": "رومنسية",
      "slug": "89590d4f-66a1-476f-bd54-b829201f8c5c"
    },
    {
      "id": 12,
      "name": "قصيرة",
      "slug": "39c7975b-86b0-46a7-9426-c03de72faf03"
    },
    {
      "id": 16,
      "name": "معلقة",
      "slug": "3a0af9b5-5dab-43c0-8682-b6fc3c009f5c"
    },
    {
      "id": 21,
      "name": "حزينة",
      "slug": "52e6de61-7394-4ead-8782-213556e25c25"
    },
    {
      "id": 24,
      "name": "عامة",
      "slug": "428212f7-929c-48a9-b129-7abf407085bd"
    },
    {
      "id": 25,
      "name": "أنشودة",
      "slug": "e3df9aa4-0e68-4ae6-abbd-3e0f8244d81b"
    },
    {
      "id": 27,
      "name": "وطن",
      "slug": "765ab978-d029-454d-9af1-c8ca0d3e7f90"
    }
  ];

  static const meters = [
    {
      "id": 1,
      "name": "أحذ الكامل",
      "slug": "ahd-alkamil"
    },
    {
      "id": 2,
      "name": "مشطور الرجز",
      "slug": "mashtur-alrajz"
    },
    {
      "id": 3,
      "name": "مخلع البسيط",
      "slug": "mukhalla-albasit"
    },
    {
      "id": 4,
      "name": "موشح",
      "slug": "muwashah"
    },
    {
      "id": 5,
      "name": "القوما",
      "slug": "alqawma"
    },
    {
      "id": 6,
      "name": "الهزج",
      "slug": "alhazaj"
    },
    {
      "id": 7,
      "name": "مجزوء الرمل",
      "slug": "majzu-alramal"
    },
    {
      "id": 8,
      "name": "مجزوء موشح",
      "slug": "majzu-muwashah"
    },
    {
      "id": 9,
      "name": "منهوك",
      "slug": "manhuk"
    },
    {
      "id": 10,
      "name": "الكامل",
      "slug": "alkamil"
    },
    {
      "id": 11,
      "name": "المجتث",
      "slug": "almujtath"
    },
    {
      "id": 12,
      "name": "مجزوء الطويل",
      "slug": "majzu-altawil"
    },
    {
      "id": 13,
      "name": "مخلع",
      "slug": "mukhalla"
    },
    {
      "id": 14,
      "name": "الدوبيت",
      "slug": "aldubayt"
    },
    {
      "id": 15,
      "name": "الوافر",
      "slug": "alwafir"
    },
    {
      "id": 16,
      "name": "المواليا",
      "slug": "almawaliya"
    },
    {
      "id": 17,
      "name": "غير مصنف",
      "slug": "ghayr-musanaf"
    },
    {
      "id": 18,
      "name": "المديد",
      "slug": "al-madid"
    },
    {
      "id": 19,
      "name": "الطويل",
      "slug": "altawil"
    },
    {
      "id": 20,
      "name": "السلسلة",
      "slug": "alsilsila"
    },
    {
      "id": 21,
      "name": "مشطور",
      "slug": "mashtur"
    },
    {
      "id": 22,
      "name": "المقتضب",
      "slug": "almuqtadab"
    },
    {
      "id": 23,
      "name": "مجزوء الوافر",
      "slug": "majzu-alwafir"
    },
    {
      "id": 24,
      "name": "أحذ",
      "slug": "ahd"
    },
    {
      "id": 25,
      "name": "التفعيلة",
      "slug": "altafila"
    },
    {
      "id": 26,
      "name": "المضارع",
      "slug": "almudari"
    },
    {
      "id": 27,
      "name": "مجزوء الخفيف",
      "slug": "majzu-alkhafif"
    },
    {
      "id": 28,
      "name": "تفعيلة",
      "slug": "tafila"
    },
    {
      "id": 29,
      "name": "السريع",
      "slug": "alsarie"
    },
    {
      "id": 30,
      "name": "منهوك المنسرح",
      "slug": "manhuk-almunsarih"
    },
    {
      "id": 31,
      "name": "المنسرح",
      "slug": "almunsarih"
    },
    {
      "id": 32,
      "name": "مربع",
      "slug": "murabba"
    },
    {
      "id": 33,
      "name": "مجزوء الرجز",
      "slug": "majzu-alrajz"
    },
    {
      "id": 34,
      "name": "المتدارك",
      "slug": "almutadarak"
    },
    {
      "id": 35,
      "name": "عدد",
      "slug": "adad"
    },
    {
      "id": 36,
      "name": "المتقارب",
      "slug": "almutakarib"
    },
    {
      "id": 37,
      "name": "الرجز",
      "slug": "alrajz"
    },
    {
      "id": 38,
      "name": "مجزوء المتقارب",
      "slug": "majzu-almutakarib"
    },
    {
      "id": 39,
      "name": "الخفيف",
      "slug": "alkhafif"
    },
    {
      "id": 40,
      "name": "مجزوء الهزج",
      "slug": "majzu-alhazaj"
    },
    {
      "id": 41,
      "name": "الرمل",
      "slug": "alramal"
    },
    {
      "id": 42,
      "name": "مجزوء",
      "slug": "majzu"
    },
    {
      "id": 43,
      "name": "البسيط",
      "slug": "albasit"
    },
    {
      "id": 44,
      "name": "مجزوء الكامل",
      "slug": "majzu-alkamil"
    }
  ];

}