
  
class URLS {
  static const bool isProd = true;

  static String baseUrl =
      isProd ? "http://sowmyamatsa.pythonanywhere.com" : "http://sowmyamatsa.pythonanywhere.com";

 // static String login = "http://sowmyamatsa.pythonanywhere.com/api/token/";
  // static String personalizeTVRadio = "/api/v1/stations?limit=20";

  // static String currentStations = "/api/v1/stations?include=currentShow";

  // // News
  // static String breakingNews = "/api/v1/news/breaking?platform=mobile";
  // static String newsMenu = "/api/v1/news/menus?platform=mobile";

  // static String searchData(String query, int page) =>
  //     "/api/v1/search?term=$query&page=$page";

  // static String newsList(String menuId, String slug, int page) =>
  //     "/api/v1/news?menu_id=$menuId&slug=$slug&page=$page";

  // static String newsDetails(String newsId) =>
  //     "/api/v1/news/details?news_id=$newsId&platform=mobile";

  // static String similarNews(String newsId) =>
  //     "/api/v1/news/similar?article_id=$newsId&platform=mobile";

  // static String relatedNews(String newsId) =>
  //     "/api/v1/news/related?article_id=$newsId&platform=mobile";

  // // TV
  // static String tvStations =
  //     "/api/v1/stations/?station_type=tv&include=currentShow&limit=20";

  // static String tvStationGeneral(String stationId) =>
  //     "/api/v1/stations/general?station_id=$stationId";

  // static String stationShows(String stationId) =>
  //     "/api/v1/stations/shows?station_id=$stationId&include=episodes";

  // static String stationShowEpisodes(String showId) =>
  //     "/api/v1/stations/episodes?show_id=$showId";

  // static String tvEpisodeDetails(String episodeId) =>
  //     "/api/v1/stations/episode/details?episode_id=$episodeId";

  // static String tvSchedule(String stationId) =>
  //     "/api/v1/stations/details?include=programmes&station_id=$stationId";

  // static String tvProgramShows(String programId) =>
  //     "/api/v1/stations/videos?programme_id=$programId";

  // // Radio
  // static String radioStations =
  //     "/api/v1/stations/?station_type=radio&include=currentShow&limit=20";

  // static String radioStationGeneral(String stationId) =>
  //     "/api/v1/stations/general?station_id=$stationId";

  // static String radioStationShows(String stationId) =>
  //     "/api/v1/stations/shows?station_id=$stationId&include=episodes";

  // static String radioStationShowEpisodes(String showId) =>
  //     "/api/v1/stations/episodes?show_id=$showId";

  // static String radioEpisodeDetails(String episodeId) =>
  //     "/api/v1/stations/episode/details?episode_id=$episodeId";

  // static String radioSchedule(String stationId) =>
  //     "/api/v1/stations/details?include=programmes&station_id=$stationId";

  // // Podcasts
  // static String podcastsPopular = "/api/v1/podcasts/popular";
  // static String podcastsCategoriesWithPodcasts =
  //     "/api/v1/podcasts/categories?include=podcasts";
  // static String podcastsCategories = "/api/v1/podcasts/categories";

  // static String podcastsByCategory(String categoryId) =>
  //     "/api/v1/podcasts?category_id=$categoryId";

  // static String podcastDetails(String podcastId) =>
  //     "/api/v1/podcasts/details?podcast_id=$podcastId";
}
