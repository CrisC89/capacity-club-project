import 'dart:math';

import 'package:capacity_club_mobile_app/core/utils/page_config.dart';
import 'package:capacity_club_mobile_app/domain-features/core/widget/exercise-video-player/exercise_video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrainingSession {
  bool isCompleted;

  TrainingSession({required this.isCompleted});
}

class Week {
  final int weekNumber;
  final List<TrainingSession> sessions;

  Week({required this.weekNumber, required this.sessions});
}

class PersonalTrainingPage extends StatefulWidget {
  const PersonalTrainingPage({super.key});
  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.dumbbell,
      name: 'training',
      child: PersonalTrainingPage());
  @override
  _PersonalTrainingPageState createState() => _PersonalTrainingPageState();
}

class _PersonalTrainingPageState extends State<PersonalTrainingPage> {
  final List<Week> weeks = List.generate(4, (weekIndex) {
    return Week(
      weekNumber: weekIndex + 1,
      sessions: List.generate(7, (sessionIndex) {
        return TrainingSession(isCompleted: Random().nextBool());
      }),
    );
  });

  void _toggleCompletion(int weekIndex, int sessionIndex) {
    setState(() {
      weeks[weekIndex].sessions[sessionIndex].isCompleted =
          !weeks[weekIndex].sessions[sessionIndex].isCompleted;
    });
  }

  void _openSession(int weekIndex, int sessionIndex) {
    print('Opening session ${sessionIndex + 1} of week ${weekIndex + 1}');
  }

  double _calculateProgress() {
    int completedSessions = 0;
    int totalSessions = 0;
    for (var week in weeks) {
      for (var session in week.sessions) {
        if (session.isCompleted) {
          completedSessions++;
        }
        totalSessions++;
      }
    }
    return completedSessions / totalSessions;
  }

  @override
  Widget build(BuildContext context) {
    double progress = _calculateProgress();

    return Scaffold(
      appBar: AppBar(
        title: Text('Entraînement Personnel'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Progression Globale
              Center(
                child: Column(
                  children: [
                    Text(
                      'Progression Globale',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 10,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        Text(
                          '${(progress * 100).toStringAsFixed(1)}%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              // Sessions par semaine
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: weeks.length,
                itemBuilder: (context, index) {
                  final week = weeks[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semaine ${week.weekNumber}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 20,
                                child: Container(
                                  height: 2,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  week.sessions.length,
                                  (sessionIndex) {
                                    final session = week.sessions[sessionIndex];
                                    return GestureDetector(
                                      onTap: () =>
                                          _openSession(index, sessionIndex),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: session.isCompleted
                                              ? Colors.green
                                              : Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            (sessionIndex + 1).toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
