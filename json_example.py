import simplejson
import os

#In this example the filename is jsonfile
#
#./ to check file in this directory		#stat to check if it's empty
if os.path.isfile("./jsonfile.json") and os.stat("jsonfile.json").st_size != 0:

	#open the file to work with it
	work_file = open("./jsonfile.json","r+")

	#new var just to keep it simple
	data = simplejson.loads(work_file.read())

	#you can work with the values calling them by their name
	data["edad"]+=1
	print(data["nombre"],data["edad"])

else:
	#file does not exist or is empty
	print("Creando archivo")

	#creating a file
	work_file = open("./jsonfile.json","w+")

	#adding stuff in the file like a dictionary
	data = {"nombre": "Alejandro", "edad": 28}
	print(data["nombre"]," creado exitosamente")

work_file.seek(0)
work_file.write(simplejson.dumps(data))
