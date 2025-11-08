import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> workoutCategories = [
      {
        'name': 'Cardio',
        'icon': Icons.directions_run,
        'color': Colors.blue,
        'exercises': 12,
      },
      {
        'name': 'Strength',
        'icon': Icons.fitness_center,
        'color': Colors.red,
        'exercises': 18,
      },
      {
        'name': 'Yoga',
        'icon': Icons.self_improvement,
        'color': Colors.purple,
        'exercises': 15,
      },
      {
        'name': 'Stretching',
        'icon': Icons.accessibility_new,
        'color': Colors.green,
        'exercises': 10,
      },
    ];

    final List<Map<String, dynamic>> recentWorkouts = [
      {
        'name': 'Morning Run',
        'duration': '30 min',
        'calories': 250,
        'date': 'Today',
      },
      {
        'name': 'Upper Body Workout',
        'duration': '45 min',
        'calories': 320,
        'date': 'Yesterday',
      },
      {
        'name': 'Yoga Session',
        'duration': '40 min',
        'calories': 180,
        'date': '2 days ago',
      },
    ];

    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: const Text('Workouts'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {},
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: workoutCategories.length,
                itemBuilder: (context, index) {
                  final category = workoutCategories[index];
                  return Card(
                    elevation: 0,
                    color: category['color'].withOpacity(0.1),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              category['icon'],
                              color: category['color'],
                              size: 48,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              category['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${category['exercises']} exercises',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Recent Workouts',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              ...recentWorkouts.map((workout) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.fitness_center,
                        color: Colors.deepOrange,
                      ),
                    ),
                    title: Text(
                      workout['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.timer, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(workout['duration']),
                          const SizedBox(width: 16),
                          Icon(Icons.local_fire_department,
                              size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text('${workout['calories']} cal'),
                        ],
                      ),
                    ),
                    trailing: Text(
                      workout['date'],
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                );
              }).toList(),
            ]),
          ),
        ),
      ],
    );
  }
}