# Hériter de la classe list
# Dans cet exercice, vous devez faire hériter la classe ListeCustom de la classe list de Python.

# On doit ainsi pouvoir utiliser la méthode append sur notre instance liste.

# Vous devez ajouter le nombre 5 à l'instance liste.

class ListCustom(list):
    def __init__(self):
        super().__init__()

liste = ListCustom()
        
liste.append(5)
print(liste)
