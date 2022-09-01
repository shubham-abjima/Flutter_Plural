import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofitexample/model/task_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  //@Headers- to pass the headers dynamically.
  @GET("photos")
  Future<List<TaskModel>> getTasks(@Header("Content-Type") String contentType);

  @GET("/comments")
  Future<List<CommentsModel>> getAllComments();

  // @GET("/albums")
  // Future<List<albumsModel>> getAllalbums();

  // @GET("/users")
  // Future<List<usersModel>> getAllusers();

  // @Path- To update the URL dynamically replacement block surrounded by { } must be annotated with @Path using the same string.
  // @GET("/posts/{id}")
  // Future<TaskModel> getPostFromId(@Path("id") int postId);

  // @GET("/comments?postId={id}")
  // Future<TaskModel> getCommentFromPostId(@Path("id") int postId);

  // @GET("/comments")
  // Future<TaskModel> getCommentFromPostIdWithQuery(
  // @Query- used to append the URL.
  //     @Query("postId") int postId);
  //This yields to "/comments?postId=postId
  // @DELETE("/posts/{id}")
  // Future<void> deletePost(@Path("id") int postId);

  // @Body- Sends dart object as the request body.
  // @POST("/posts")
  // Future<TaskModel> createPost(@Body() TaskModel post);
}
