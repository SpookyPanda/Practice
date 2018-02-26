# -*- coding: utf-8 -*-

#PROGRAM THAT PRETENDS TO BE AN IMAGINARY HOSPITAL
#JUST FOR PRACTICE, I KNOW IT HAS FLAWS AND IT'S KIND OF HARD TO READ

import os
users=['mario','veronica','simon']
passwords=['12345','54321','simonquesi']
permissons=['a','d','r']
patients_list=[]
#
#
#OBJECT PROIPERTIES
#
#
class patient(object):
	def __init__(self,name,age,doctor,speciality):
		self.name=name
		self.age=age
		self.doctor=doctor
		self.speciality=speciality
		self.balance2=0
		self.balance=[]
		self.moves=[]

		#SET A DATE AND CHECK IT'S IN A VALID HOUR
	def set_date(self,day,hour):
		hour=int(input("Las citas son cada hora en formato de 24h.\nHora de la cita: "))
		if hour<=4 or hour>=11:
			return("Solo emergencias.")
		else:
			causes=input("Motivo de la cita: ")
			(self.date).append("Tiene cita a las "+str(hour)+" horas en "+str(causes)+" el día "+day)
			return print("Cita agendada exitosamente")

		#SHOW DATES
	def see_dates(self):
		for i in range(0,len(self.date)):
			print ("Cita # ",i+1,"	",self.date[i])
		return print("\n\nFin")

		#FOR THE PATIENTS
	def debt(self,causes,owe):
		if owe<=0:
			return print("Cantidad no válida.")
		else:
			(self.moves).apnamepend("Se hace un cargo de $"+str(owe)+" por %s"%(causes))
			self.balance2-=owe
			return print("Su nuevo saldo es de %s"%(self.balance))

		#CHECK A VALID PAYMENT IS MADE
	def pay(self,payment):
		if payment<=0:
			return print("Cantidad no válida.")
		else:
			(self.moves).append("Se hace un abono por $"+str(payment))
			self.balance2+=payment
			return print("Su nuevo saldo es de %s"%(self.balance))

		#THIS WILL PRINT ANY MOVEMENT DONE TO THE OBJECT
	def print(self):
		for i in range(0,len(self.moves)):
			print(self.moves[i])
		return input("Saldo: ",self.balance2)
#
#
#INICIA PROGRAMA
#
#

#Creating a variable that will allow me to move in diferente menus
e='login'
while True:
	#You are not suposed to stop running the software intentionally

	#First state, won't change unless password and username are correct
	while e=='login':
		os.system("cls")
		usr=input("Ingrese su usuario: ")
		if usr in users:
			i=users.index(usr)
			password=input("Ingrese su contraseña: ")
			if password==passwords[i]:
				e=permissons[i]
				print("Ingresando...")
			else:
				print('Contraseña incorrecta.')
		else:
			print('No se encontró el usuario.')

	#MENU FOR ADMINISTRATOR
	while e=='a':
		input("Presiona 'Enter' para continuar.")
		os.system("cls")

		#OPTIONS GIVEN TO ADMINISTRATE
		editusrs=input("1)Crear usuario\n2)Eliminar usuario\n\n0)Salir\n\nSeleccione una opción:	")
		#
		#ADD OPTIONS AT WILL



		#CREATE A NEW USER
		#FOR THIS, CHECK IT'S NOT REPEATED AND THE PERMISSON GIVEN IS VALID

		if editusrs=='1':
			usrname=str(input("Seleccione un nombre de usuario:	"))
			if usrname in users:
				print("Este nombre de usuario ya está en uso.")
			elif len(usrname)<=4:
				print("Nombre de usuario demasiado corto.")
			elif len(usrname)>=16:
				print("Nombre de usuario demasiado largo.")
			else:
				newpass=str(input("Digite una contraseña:	"))
				if len(newpass)<=4:
					print("Contraseña demasiado corta")
				else:
					os.system("cls")
					passconfirm=str(input("Confirme la contraseña: "))
					if passconfirm == newpass:
						os.system("cls")
						usrtype=input("a)Administrador\nm)Medico\nr)Recepción\nPermisos del usuario: ")
						if usrtype == ('a' or 'b' or 'c'):
							#
							#____ONLY CREATES USER FOR THE LOGIN
							#
							users.append(usrname)
							passwords.append(newpass)
							permissons.append(usrtype)
						else:
							print("Permiso inexistente")
					else:
						print("Contraseña incorrecta.")

		#DELETE A USER
		elif editusrs=='2':
			usrdelete=str(input("Nombre del usuario a eliminar: "))
			if usrdelete in users:
				confirm_delete=input("¿Seguro que desea eliminar permanentemente a ",usrdelete,"? (s/n)\n")
				if confirm_delete=='s':
					j=users.index(usrdelete)
					users.pop(j)
					passwords.pop(j)
					permissons.pop(j)
				else:
					print("Saliendo...")
			else:
				print ("Usuario inexistente.")
		elif editusrs=='0':
			e='login'

			#TEST (DOES NOTHING)
	while e=='m':
		input("Presiona 'Enter' para continuar")
		os.system("cls")
		med_action=input("woolooloo")

		#RECEPTIONIST MENU
	while e=='r':
		input("Presiona 'Enter' para continuar.")
		os.system("cls")
		recepcionist=input("1)Ingresar paciente\n2)Buscar paciente\n\n\n")
		#REGISTRATE A NEW PATIENT AND ASK FOR SOME DATA
		if recepcionist == '1':
			name=str(input("Nombre (completo) del paciente: "))
			age=str(input("Edad: "))
			speciality=str(input("Especialidad: "))
			doctor=str(input("Doctor asignado: "))
			confirmation=input("Los datos son correctos(s/n): ")
			if confirmation=='s':
				patients_list.append(name)
				position=patients_list.index(name)
				patients_list[position]=patient(name,age,doctor,speciality)
				print("Operación exitosa.")
			else:
				break

		#DISPLAY PATIENT INFORMATION
		if recepcionist=='2':
			patient_id=input("Nombre del paciente: ")
			if patient_id in patients_list:
				k=patients_list.index(patient_id)
				e='patient'
			else:
				print("No se encontró al paciente.")

	#PATIENT MENU
	while e=='patient':
		input("Presione 'Enter' para continuar")
		os.system("cls")
		input("Presiona 'Enter' para continuar")
		print("1)Agendar cita.\n2)Ver citas.\n3)Ver estado de cuenta\n4)Pago\n\n0)Regresar")
		selection=input("Seleccione una opción.")

		#REASON AND DATE
		if selection=='1':
			day=str(input("Día: "))
			hour=str(input("Hora: "))
			cause=str(input("Motivo/procedimiento: "))
			cost=float(input("Costo del procedimiento: "))
			patients_list[k].set_date(day,hour)
			patients_list[k].debt(cause,cost)

		#FUNCTIONS ALREADY DEFINED
		elif selection=='2':
			patients_list[k].see_dates()
		elif selection=='3':
			patients_list[k].print()
		elif selection=='4':
			amout=float(input("Cantidad a depositar: "))
			patients_list[k].pay(amout)
		elif selection==0:
			e='r'
		else:
			print("Selección no válida.")
