import 'package:flutter/foundation.dart';

import 'package:scheduler_app/services/models/schedule_datamodel.dart';
import 'package:scheduler_app/src/res/constants.dart';

class ScheduleProvider extends ChangeNotifier {
  List<SchedueModel> activeSchedules = [];
  SchedueModel? sunday;
  SchedueModel? monday;
  SchedueModel? tuesday;
  SchedueModel? wednesday;
  SchedueModel? thursday;
  SchedueModel? friday;
  SchedueModel? saturday;
  String? shedulestring1;
  String? shedulestring2;

  selectSchedules(day, options) {
    switch (day) {
      case 0:
        var slots = gettimeslots(options);
        var selectedday = AppConstants().days[0];
        sunday = SchedueModel(day: selectedday, timeSlots: slots);

        break;
      case 1:
        var slots = gettimeslots(options);
        var selectedday = AppConstants().days[1];
        monday = SchedueModel(day: selectedday, timeSlots: slots);
        break;
      case 2:
        var slots = gettimeslots(options);
        var selectedday = AppConstants().days[2];
        tuesday = SchedueModel(day: selectedday, timeSlots: slots);
        break;
      case 3:
        var slots = gettimeslots(options);
        var selectedday = AppConstants().days[3];
        wednesday = SchedueModel(day: selectedday, timeSlots: slots);
        break;

      case 4:
        var slots = gettimeslots(options);
        var selectedday = AppConstants().days[4];
        thursday = SchedueModel(day: selectedday, timeSlots: slots);
        break;

      case 5:
        var slots = gettimeslots(options);
        var selectedday = AppConstants().days[5];
        friday = SchedueModel(day: selectedday, timeSlots: slots);
        break;

      case 6:
        var slots = gettimeslots(options);
        var selectedday = AppConstants().days[6];
        saturday = SchedueModel(day: selectedday, timeSlots: slots);
        break;

      default:
    }
    notifyListeners();
  }

  saveSchedule() {
    activeSchedules.clear();
    try {
      if (sunday != null) {
        activeSchedules.add(sunday!);
      }
      if (monday != null) {
        activeSchedules.add(monday!);
      }
      if (tuesday != null) {
        activeSchedules.add(tuesday!);
      }
      if (wednesday != null) {
        activeSchedules.add(wednesday!);
      }
      if (thursday != null) {
        activeSchedules.add(thursday!);
      }
      if (friday != null) {
        activeSchedules.add(friday!);
      }
      if (saturday != null) {
        activeSchedules.add(saturday!);
      }

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    generateString();
  }

  clearAll() {
    // tempSchedules.clear();
    activeSchedules.clear();
    sunday = null;
    monday = null;
    tuesday = null;
    wednesday = null;
    thursday = null;
    friday = null;
    saturday = null;
    shedulestring1="";
    shedulestring2="";
    notifyListeners();
  }
//mrng,atrnoon,evning =wholeday

  generateString() {
    for (var i = 0; i < activeSchedules.length; i++) {
if(activeSchedules[i]==activeSchedules.last){
      if (activeSchedules.last.timeSlots.length == 3) {
        shedulestring2 =
            "${shedulestring2! + activeSchedules.last.day} Whole Day. ";
        notifyListeners();
      }    else {
        String slots = "";        for (var k = 0; k < activeSchedules.last.timeSlots.length; k++) {

          slots= "$slots${activeSchedules.last.timeSlots[k]}, ";
        }
        notifyListeners();

       shedulestring2="${shedulestring2!}${activeSchedules.last.day} $slots";
      }




  return;
}

      if (activeSchedules[i].timeSlots.length == 3) {
        shedulestring1 =
            "${shedulestring1! + activeSchedules[i].day} Whole Day, ";
        notifyListeners();
      } else {
        String slots = "";
        for (var j = 0; j < activeSchedules[i].timeSlots.length; j++) {

          slots= "$slots${activeSchedules[i].timeSlots[j]}, ";
        }
        notifyListeners();

       shedulestring1="${shedulestring1!}${activeSchedules[i].day} $slots";
      }
    }
  }

  List<String> gettimeslots(List<int> timelots) {
    List<String> slots = [];
    for (var i = 0; i < timelots.length; i++) {
      slots.add(AppConstants().sheduleTimings[timelots[i]]);
    }
    return slots;
  }
}
