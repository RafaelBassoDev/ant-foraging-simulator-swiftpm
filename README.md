# Ant Foraging Simulator

<br>

<p align="center">
  <img src="/readme-resources/app-logo.png" width="400" height="400">
</p>

<br>

In this project I decided to create an Ant Foraging Simulator, a project where some ants will wander around searching for food to bring back to their colony. As they walk, pheromones will be left on their path to help other ants to find the best route to some food or to the colony.

I've been wanting to do this project for a while now, because since the beginning it amazed me and I always thought that there were a lot of things to learn in order to create a simulation.

Adding the fact that Ants are really intricate beings and have some amazing behaviors in the nature, I decided to face the challenge and use this simulator as my main idea to apply for the WWDC22 Swift Student Challenge.
<br>
<hr>
<br>
Here you can see a little more about the entities that are used on the simulation:

## Table of contents

| **Entity** | **Description** | **Image** |
| :---: | :--- | :---: |
| **Blue Ant** | The role of the Blue Ant is to search for food around the world. It has three pheromone sensors in front of their bodies so they can navigate around. | <img src="/readme-resources/blue_ant_sensors.png" width="150"/> |
| **Red Ant** | When a Blue Ant finds some food, it will transform into a Red Ant. They will try to deliver the food to the colony. After delivering the food, it will turn into a Blue Ant yet again. | <img src="/readme-resources/red_ant_sensors.png" width="150"/> |
| **Blue Pheromone** | While a Blue Ant wanders around, it will leave blue pheromones behind. Red ants will follow blue pheromones so that they can find a suitable path to the colony. | <img src="/readme-resources/blue_pheromone_trail.png" width="150"/> |
| **Red Pheromone** | While walking, a Red Ant will leave red pheromones behind. Blue Ants will follow red pheromones so that they can find a path that will probably lead them to some food. | <img src="/readme-resources/red_pheromone_trail.png" width="150"/> |
| **Food** | Food is one of the main aspects of the simulation. Blue Ants will search for it while Red Ants will deliver it to the colony, creating a cycle. | <img src="/readme-resources/green_food.png" width="150"/> |
| **Anthill** | It is the beginning and the reason of everything. (At least for the ants...). This is where the journey of the Blue Ants will start, and will be the ending point for the Red Ants. | <img src="/readme-resources/brown_anthill.png" width="150"/> |

<br>
<hr>
<br>

## Screenshots
<br>

### Onboarding
<p align="leading">
  <img src="/readme-resources/image_menu.png" width="400" height="400">
</p>

### Simulation
<p align="leading">
  <img src="/readme-resources/image_simulation.png" width="400" height="400">
</p>

### Simulation Menu
<p align="leading">
  <img src="/readme-resources/image_simulation_menu.png" width="400" height="400">
</p>
