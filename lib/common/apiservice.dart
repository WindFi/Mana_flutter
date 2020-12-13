import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:json_serializable/json_serializable.dart';

part 'service.g.dart';

@RestApi(baseUrl: "https://localhost:443/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET("on_air")
  Future<ResponseWrapper<List<Air>>> listAirs(@Query("type") int type);
  @GET("my_bangumi")
  Future<ResponseWrapper<List<Air>>> listMyBangumi(@Query("status") int status);
  @GET("bangumi")
  Future<QueryResponseWrapper<List<Air>>> queryBangumis(
      @Query("page") int page,
      @Query("count") int count,
      @Query("sort_field") String sortField,
      @Query("sort_order") String order,
      @Query("name") String name,
      @Query("type") int type);
  @GET("bangumi/{id}")
  Future<ResponseWrapper<Bangumi>> queryBangumi(@Path("id") String id);
}

@JsonSerializable()
class ErrorMessage {
  String message;
}

@JsonSerializable()
class QueryResponseWrapper<T> extends ResponseWrapper<T> {
  int total;
}

@JsonSerializable()
class ResponseWrapper<T> {
  T data;
}

@JsonSerializable()
class Air {
  String id;
  String content;
  @JsonKey(name: "image_url")
  String imageUrl;
  int position;
  @JsonKey(name: "sort_order")
  int sort;
  @JsonKey(name: "start_time")
  int startTime;
  @JsonKey(name: "end_time")
  int endTime;
  @JsonKey(name: "favorite_status", defaultValue: -1)
  int favoriteState;
  Bangumi bangumi;
}

@JsonSerializable()
class Thumbnail {
  @JsonKey(name: "domainColor")
  String color;
  String url;
  int width;
  int height;
}

@JsonSerializable()
class Episode {
  String id;
  @JsonKey(name: "bangumi_id")
  String bangumiId;
  @JsonKey(name: "bgm_eps_id")
  int bgmEpsId;
  String name;
  @JsonKey(name: "name_cn")
  String nameCN;
  String thumbnail;
  int status;
  @JsonKey(name: "episode_no")
  int episodeNO;
  @JsonKey(name: "create_time")
  int createTime;
  @JsonKey(name: "update_time")
  int updateTime;
  @JsonKey(name: "airdate")
  String airDate;
  @JsonKey(name: "delete_mark")
  int deleteMark;
  String duration;

  @JsonKey(name: "thumbnail_color")
  String thumbnailColor;
  @JsonKey(name: "thumbnail_image")
  Thumbnail thumbnailImage;
  @JsonKey(name: "watch_progress")
  WatchProgress watchProgress;
}

@JsonSerializable()
class WatchProgress {
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "last_watch_position")
  double position;
  @JsonKey(name: "bangumi_id")
  String bangumiId;
  @JsonKey(name: "watch_status")
  int watchStatus;
  @JsonKey(name: "episode_id")
  String episodeId;
  double percentage;
  @JsonKey(name: "last_watch_time")
  int lastWatchTime;
  String id;
}

@JsonSerializable()
class VideoFile {}

@JsonSerializable()
class Bangumi {
  String id;
  @JsonKey(name: "bgm_id")
  int bgmId;
  String name;
  @JsonKey(name: "name_cn")
  String nameCN;
  String summary;
  String image;
  String cover;
  @JsonKey(name: "cover_color")
  String coverColor;
  @JsonKey(name: "cover_image")
  Thumbnail coverImage;
  @JsonKey(name: "create_time")
  int createTime;
  @JsonKey(name: "update_time")
  int updateTime;
  @JsonKey(name: "eps_no_offset")
  int epsNoOffset;
  String dmhy;
  int type;
  int status;
  @JsonKey(name: "air_date")
  String airDate;
  @JsonKey(name: "air_weekday")
  int airWeekday;
  @JsonKey(name: "delete_mark")
  int deleteMark;
  @JsonKey(name: "acg_rip")
  String acgRip;
  String rss;
  @JsonKey(name: "eps_regex")
  String epsRegex;
  int eps;
}
