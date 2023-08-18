import 'package:image_search/data/datasource/pixabay_api.dart';
import 'package:image_search/data/repository/photoapi_repository_impl.dart';
import 'package:image_search/domain/repository/photoapi_repository.dart';
import 'package:image_search/domain/usecase/get_photo_usecase.dart';
import 'package:image_search/presentation/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...depedentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<http.Client>(create: (context) => http.Client())
];

List<SingleChildWidget> depedentModels = [
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) => PixabayApi(client),
  ),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
    update: (context, api, _) => PhotoApiRepositoryImpl(api),
  ),
  ProxyProvider<PhotoApiRepository, GetPhotoUseCase>(
    update: (context, repository, _) => GetPhotoUseCase(repository),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<GetPhotoUseCase>()),
  ),
];
