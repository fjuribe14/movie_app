import 'package:new_app/config/config.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/infrastructure/models/models.dart';

class CastMapper {
  static Cast castsMovieDBToCast(CastDBMovie castdb) => Cast(
        id: castdb.id,
        job: castdb.job ?? '',
        name: castdb.name,
        order: castdb.order ?? 0,
        adult: castdb.adult,
        gender: castdb.gender,
        castId: castdb.castId ?? 0,
        creditId: castdb.creditId,
        character: castdb.character ?? '',
        popularity: castdb.popularity,
        department: castdb.department ?? '',
        profilePath: castdb.profilePath == ''
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${castdb.profilePath}',
        originalName: castdb.originalName,
        knownForDepartment: castdb.knownForDepartment,
      );
}
