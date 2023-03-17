import 'package:flutter_template_project/data/repo/click_repo/click_local_repo.dart';
import 'package:flutter_template_project/domain/repo/click_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ClickRepo)
class ClickRepoImpl extends ClickRepo {
  final ClickLocalRepo _clickLocalRepo;

  ClickRepoImpl(this._clickLocalRepo);

  @override
  Future<void> saveClicks({required int clicks}) async {
    await _clickLocalRepo.saveClicks(clicks: clicks);
  }
}
