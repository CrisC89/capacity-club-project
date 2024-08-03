import 'package:capacity_club_mobile_app/unused/collective_training_exercise_exension_title_widget.dart';
import 'package:flutter/material.dart';

class TrainingExample {
  Widget build(BuildContext context) {
    const String fakeText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer cursus tellus nisi, at efficitur nisl dictum scelerisque. Nunc pellentesque risus sed turpis accumsan, et ultrices dolor varius. Cras dapibus gravida tellus. Curabitur at justo in metus pretium posuere. Aenean gravida eget lectus nec laoreet. Vestibulum mattis, ex ut dapibus pretium, massa lorem mollis turpis, ut mattis arcu dolor ut nisi. Cras fermentum semper maximus.";

    return Scaffold(
      appBar: AppBar(
        title: Text('Training Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Image.asset('assets/img/icon_logo_v2.png',
                              width: 200)),
                      SizedBox(height: 16),
                      Text(
                        'Training Example',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Date: 2024-06-08',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Time: 9h-10h',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Slots: 9 / 15',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            'Available',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      subSectionTitle(context, 'Training information'),
                      Text(fakeText),
                      ExerciseExpansionTile(
                        title: 'Warm Up',
                        exercises: [
                          'Mobilité général',
                          '2x20 single leg hip thrust',
                          '2x15-20 squat touch down',
                          'KB complex',
                          '2x10 one arm KB row',
                          '10 hip swing + 10 russian',
                          '10 KB goblet squat',
                          '2x5 kb push press + 2x5 kb jerk',
                        ],
                      ),
                      ExerciseExpansionTile(
                        title: 'Back squat',
                        exercises: [
                          'Heavy single à rpe 9-10',
                          '3x3 paused back squat à 75% de la rep lourde rest = 2\'30" max (du rythme)',
                        ],
                      ),
                      ExerciseExpansionTile(
                        title:
                            'Partner I go you go 8 round total - cap time 11',
                        exercises: [
                          '9 double KB swing',
                          '6 double KB squat',
                          '3 double KB jerk',
                          'cash out',
                          'CAL AB',
                          '80 FF / 90 FH / 100 HH',
                        ],
                      ),
                      ExerciseExpansionTile(
                        title: 'ACCESSORY WORK',
                        exercises: [
                          '3x 8-12 Magic triceps',
                          '3x15-20 bent over flys',
                          '3x8-12 single leg rdl',
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Register'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Details'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container subSectionTitle(BuildContext context, String text) {
  return Container(
      width: Size.infinite.width,
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text.toUpperCase(),
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 2)));
}
