import 'package:equatable/equatable.dart';
// import 'category_model.dart';

class Food extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Food({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt,
  });
  static List<Food> foods = [
    Food(
      id: '1',
      author: 'Nwanozie',
      authorImageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Flockport-ny-usa-july-small-typical-american-house-small-typical-american-house-166514313.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Ftypical-american-house.html&tbnid=GcsUn_h0RZixuM&vet=12ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygFegUIARDtAQ..i&docid=A-uypSph1URPaM&w=800&h=451&q=united%20states%20house%20pictures&ved=2ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygFegUIARDtAQ',
      title:
          'Camel ipsuim asdfo dfgjnsd ijndfgjn ijnfgijsdfgn iundguij iuabdgbij',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      body:
          'ISDFG Isoifdoiwtg aeoringn oinrgwre oinadsvm oidnergn oindga;kjnioune iuneufeufqin iquwe iniunwe iuqowdukqu',
      category: 'Current Affairs',
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.premiumtimesng.com%2Fwp-content%2Ffiles%2F2018%2F09%2FCovenant-University.jpg&imgrefurl=https%3A%2F%2Fwww.premiumtimesng.com%2Fnews%2Ftop-news%2F286731-three-nigerian-universities-ranked-among-worlds-best.html&tbnid=Gw9CgCJW92GNuM&vet=12ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygAegUIARDcAQ..i&docid=-VS6V-xT2EB2EM&w=927&h=450&q=photos%20of%20nigerian%20universities&ved=2ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygAegUIARDcAQ',
      subtitle:
          'iuefutbg iuweryfaef uyqwefhue fb yrbf yubrqe iuhbuhbefa uhassya uaeyvsdfhy uybdashfa uyybdsfhus asuy',
      views: 1123,
    ),
    Food(
      id: '2',
      author: 'Nwanozie',
      authorImageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.worldatlas.com%2Fr%2Fw1200%2Fupload%2Feb%2Fed%2Fcc%2Fshutterstock-102409675.jpg&imgrefurl=https%3A%2F%2Fwww.worldatlas.com%2Farticles%2Famerica-s-most-popular-house-styles.html&tbnid=LVI2tFm9MclykM&vet=12ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygDegUIARDpAQ..i&docid=kYtxqWR_nRkYRM&w=1100&h=734&q=united%20states%20house%20pictures&ved=2ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygDegUIARDpAQ',
      title:
          'food ipsuim asdfo dfgjnsd ijndfgjn ijnfgijsdfgn iundgfsgooiunij gnuuniugdnnuniu iundguij iuabdgbij',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      body:
          'ISDFG Isoifdoiwtg aeoringn oinrgwre oinadsvm oidnergn oindga;kjnioune iuneufeufqin iquwe iniunwe iuqowdukqu',
      category: 'Sports',
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn07.allafrica.com%2Fdownload%2Fpic%2Fmain%2Fmain%2Fcsiid%2F00561329%3Af22edf2e8a03c5e086028ef4df04393a%3Aarc614x376%3Aw735%3Aus1.jpg&imgrefurl=https%3A%2F%2Fallafrica.com%2Fstories%2F202103230038.html&tbnid=zYhKyhr11J1IKM&vet=12ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygBegUIARDeAQ..i&docid=WD7sjtAz-r2fPM&w=735&h=450&q=photos%20of%20nigerian%20universities&ved=2ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygBegUIARDeAQ',
      subtitle:
          'iuefutbg iuweryfaef uyqwefhue fb yrbf yubrqe iuhbuhbefa uhassya uaeyvsdfhy uybdashfa uyybdsfhus asuy',
      views: 2123,
    ),
    Food(
      id: '3',
      author: 'Prince I Nwanozie',
      authorImageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1573003139034-1693385f21a6%3Fixlib%3Drb-1.2.1%26ixid%3DMnwxMjA3fDB8MHxzZWFyY2h8M3x8YW1lcmljYW4lMjBob3VzZXN8ZW58MHx8MHx8%26w%3D1000%26q%3D80&imgrefurl=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Famerican-houses&tbnid=zTmvYUSuVD1zyM&vet=12ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygIegUIARDzAQ..i&docid=MKHXsd5BwKH48M&w=1000&h=667&q=united%20states%20house%20pictures&ved=2ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygIegUIARDzAQ',
      title:
          'kpekusart ipsuim asdfo dfgjnsd ijndfgjn ijnfgijsdfgn iundgfsgooiunij gnuuniugdnnuniu iundguij iuabdgbij',
      createdAt: DateTime.now().subtract(const Duration(hours: 7)),
      body:
          'ISDFG Isoifdoiwtg aeoringn oinrgwre oinadsvm oidnergn oindga;kjnioune iuneufeufqin iquwe iniunwe iuqowdukqu',
      category: 'Politics',
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fbusinesstrumpet.com%2Fwp-content%2Fuploads%2F2020%2F06%2FUniversity-of-Nigeria-799x445.jpg&imgrefurl=https%3A%2F%2Fbusinesstrumpet.com%2Ffour-nigerian-universities-ranked-among-the-top-1400-universities-in-the-world%2F&tbnid=ousT9Wt5uZZi8M&vet=12ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ..i&docid=QDDrK2_VD93KEM&w=799&h=445&q=photos%20of%20nigerian%20universities&ved=2ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ',
      subtitle:
          'iuefutbg iuweryfaef uyqwefhue fb yrbf yubrqe iuhbuhbefa uhassya uaeyvsdfhy uybdashfa uyybdsfhus asuy',
      views: 1123,
    ),
    Food(
      id: '4',
      author: 'Prince I Nwanozie',
      authorImageUrl:
          'https://www.google.com/search?q=images+unsplash+com&sxsrf=ALiCzsbQPR6bPnQAPp-jq0ZNpsBuhYGNlw:1665006003925&source=lnms&tbm=isch&sa=X&ved=2ahUKEwj7rqbbhsr6AhVFOXoKHfLuBI0Q_AUoAXoECAEQAw&biw=1034&bih=563&dpr=1#imgrc=truT82QNEllSHM',
      title:
          'Lorem ipsuim asdfo dfgjnsd ijndfgjn ijnfgijsdfgn iundgfsgooiunij gnuuniugdnnuniu iundguij iuabdgbij',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      body:
          'ISDFG Isoifdoiwtg aeoringn oinrgwre oinadsvm oidnergn oindga;kjnioune iuneufeufqin iquwe iniunwe iuqowdukqu',
      category: 'History',
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.vanguardngr.com%2Fwp-content%2Fuploads%2F2022%2F01%2FABUAD.jpg&imgrefurl=https%3A%2F%2Fwww.vanguardngr.com%2F2022%2F05%2Fabuad-ranked-best-university-in-nigeria%2F&tbnid=Uc7tWuksUR8FpM&vet=12ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygDegUIARDiAQ..i&docid=EwGIH3S-v41RLM&w=1290&h=857&q=photos%20of%20nigerian%20universities&ved=2ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygDegUIARDiAQ',
      subtitle:
          'iuefutbg iuweryfaef uyqwefhue fb yrbf yubrqe iuhbuhbefa uhassya uaeyvsdfhy uybdashfa uyybdsfhus asuy',
      views: 1123,
    )
  ];

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        views,
        createdAt,
      ];
}
