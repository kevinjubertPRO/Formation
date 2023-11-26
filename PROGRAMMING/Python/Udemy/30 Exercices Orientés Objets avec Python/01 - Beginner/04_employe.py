# Créer une classe employé
# Dans cet exercice, vous devez créer une classe Employe qui permettra de créer des employés qui auront 4 attributs :

# firstname
# name
# position
# salary

# On doit donc pouvoir avec votre script créer une instance de la sorte :
# john = Employe("John", "Smith", "Développeur Python", 45000)

class Employee:
    
    def __init__(self, firstname, name, position, salary):
        
        self.firstname = firstname
        self.name = name
        self.position = position
        self.salary = salary
        
        
john = Employee("John", "Smith", "Développeur Python", 45000)

print(john.__dict__)
        