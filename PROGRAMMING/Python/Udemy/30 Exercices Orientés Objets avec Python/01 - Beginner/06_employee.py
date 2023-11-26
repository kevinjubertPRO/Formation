class Company:
    lastname = "Docstring"
    employes = []

class Employe:

    def __init__(self, firstname, lastname, position, salary):
        self.firstname = firstname
        self.lastname = lastname
        self.position = position
        self.salary = salary

    def __repr__(self):
        return f"{self.firstname} {self.lastname}"

employes = [
            ("Pierre", "Smith", "Responsable RH", 35000),
            ("Julie", "Martin", "Développeur Python", 42000),
            ("Éric", "Dupont", "Chef de projet", 50000),
            ]

for employe_data in employes:
    employe = Employe(*employe_data)
    Company.employes.append(employe)

print(Company.employes)