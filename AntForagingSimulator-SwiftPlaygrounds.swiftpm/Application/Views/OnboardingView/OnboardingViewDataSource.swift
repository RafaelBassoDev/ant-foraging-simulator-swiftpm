
class OnboardingViewDataSource {
    static let defaultListItemModels = [
        DescriptionListItemModel(title: "Blue Ant",
                                 description:
                                    """
                                    The role of the Blue Ant is to search for food around the world.
                                    
                                    It has three pheromone sensors in front of their bodies so they can navigate around.
                                    """,
                                 imageName: "blue_ant_sensors",
                                 imageLabel: "Blue ant with sensors",
                                 titleColor: .blue),
        
        DescriptionListItemModel(title: "Red Ant",
                                 description:
                                    """
                                    When a Blue Ant finds some food, it will transform into a Red Ant.
                                    
                                    They will try to deliver the food to the colony.
                                    
                                    After delivering the food, it will turn into a Blue Ant yet again.
                                    """,
                                 imageName: "red_ant_sensors",
                                 imageLabel: "Red ant with sensors",
                                 titleColor: .red),
        
        DescriptionListItemModel(title: "Blue Pheromone",
                                 description:
                                    """
                                    While a Blue Ant wanders around, it will leave blue pheromones behind.
                                    
                                    Red ants will follow blue pheromones so that they can find a suitable path to the colony.
                                    """,
                                 imageName: "blue_pheromone_trail",
                                 imageLabel: "Blue pheromone trail",
                                 titleColor: .blue),
        
        DescriptionListItemModel(title: "Red Pheromone",
                                 description:
                                    """
                                    While walking, a Red Ant will leave red pheromones behind.
                                    
                                    Blue Ants will follow red pheromones so that they can find a path that will probably lead them to some food.
                                    """,
                                 imageName: "red_pheromone_trail",
                                 imageLabel: "Ants",
                                 titleColor: .red),
        
        DescriptionListItemModel(title: "Food",
                                 description:
                                    """
                                    Food is one of the main aspects of the simulation.
                                    
                                    Blue Ants will search for it while Red Ants will deliver it to the colony, creating a cycle.
                                    """,
                                 imageName: "green_food",
                                 imageLabel: "Food",
                                 titleColor: .green),
        
        DescriptionListItemModel(title: "Anthill",
                                 description:
                                    """
                                    It is the beginning and the reason of everything. (At least for the ants...)
                                    
                                    This is where the journey of the Blue Ants will start, and will be the ending point for the Red Ants.
                                    """,
                                 imageName: "brown_anthill",
                                 imageLabel: "Anthill",
                                 titleColor: .brown)
    ]
}
