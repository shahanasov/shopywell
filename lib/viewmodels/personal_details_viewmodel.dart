import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/data/models/personal_details_model.dart';
import 'package:shopywell/data/repositories/personal_details_repo.dart';

final personalDetailsViewModelProvider = Provider((ref) {
  return PersonalDetailsViewModel();
});

class PersonalDetailsViewModel {
  final PersonalDetailsRepository _repo = PersonalDetailsRepository();

  Future<void> saveDetails(PersonalDetailsModel model) async {
    await _repo.saveDetails(model);
  }
}
