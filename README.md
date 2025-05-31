# Autonomous Robotic Cleaner for Urban Indoor Spaces

## Overview

This project simulates an autonomous robotic cleaner designed specifically for urban indoor environments such as bedrooms. The robotic cleaner is developed and tested using **MATLAB** and **Simulink**, leveraging intelligent path planning, obstacle detection, and orientation-aware navigation to achieve complete cleaning coverage of a constrained space.

The system uses a **Depth-First Search (DFS)** algorithm for path planning, combined with virtual sensors to avoid obstacles like furniture and walls. The project includes a visual simulation of the robot’s movement and cleaning progress in a grid-represented room.

---

## Features

- **Complete cleaning coverage** of the room using DFS traversal.
- **Obstacle detection and avoidance** with simulated sensors.
- **Orientation-aware navigation** enabling realistic movement and turns.
- **Visual real-time simulation** of the robot’s path, cleaning status, and orientation.
- **Configurable room layouts** with static obstacles (e.g., bed, furniture).
- Modular and extendable MATLAB/Simulink architecture.

---

## Project Structure

| File/Folder | Description |
|-----------------------|------------------------------------------------|
| `robotic_cleaner.slx` | Simulink model file simulating robot behavior. |
| `robotic_cleaner.m` | MATLAB script implementing path planning and control algorithms. |
| `README.md` | This documentation file. |
| `images/` | Folder containing screenshots and visual outputs of the simulation. |
| `report.pdf` | Detailed project report including methodology, results, and future work. |

---

## Requirements

- MATLAB R2022a or later (Simulink toolbox required)
- Basic knowledge of MATLAB and Simulink
- (Optional) Robotics System Toolbox for SLAM extensions

---

## How to Run

1. Open MATLAB and navigate to the project folder.
2. Open the Simulink model `robotic_cleaner.slx`.
3. Run the model simulation by clicking the **Run** button.
4. Observe the robot's movement and cleaning progress in the Simulink animation and workspace.
5. For customized room layouts or algorithm adjustments, modify the parameters in `robotic_cleaner.m`.

---

## How It Works

- The room is represented as a grid matrix where `0` denotes free space and `1` denotes obstacles.
- The robot starts at a predefined position and moves step-by-step, sensing its surroundings.
- It uses the DFS algorithm to explore and clean all reachable cells, backtracking when dead ends are encountered.
- Sensor simulation prevents collisions by detecting obstacles and changing direction accordingly.
- The cleaning process ends when all accessible spaces have been visited.

---

## Future Work

Planned enhancements include:

- Integration with real-world hardware (Arduino, Raspberry Pi).
- Advanced path planning algorithms (A*, SLAM).
- Dynamic obstacle detection and avoidance.
- Battery management and automatic recharging.
- Mobile app interface for remote control.
- Machine learning for adaptive cleaning strategies.

Refer to the `report.pdf` for an in-depth discussion on future directions and improvements.

---

## License

This project is released under the MIT License. Feel free to use, modify, and distribute with appropriate credit.

---

## Contact

For questions, suggestions, or collaborations, please contact:

- **Your Name**
- Email: your.email@example.com
- GitHub: [your-github-username](https://github.com/your-github-username)

---

Thank you for checking out this project! Your feedback and contributions are welcome.
