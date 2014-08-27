#! /usr/bin/env python
# -*- coding: utf-8 -*-

'''
py1: Puedes realizar una clase en python llamada "prime_class" 
que tenga un método llamado "is_prime" y que reciba 
como entrada un número entero y que de salida regrese un 
True o False, para saber si sí es un número primo o no lo es, 
respectivamente.
Un número primo es un número que solo es divisible por sí solo y por 1. 
Instanciar la clase, para mandar a llamar el método con 4 
números no primos de ejemplo y 4 números primos de ejemplo, 
e imprimir el resultado.
'''

#definicion de la clase
class prime_class:
	
    #Definimos la funcion que hace el calculo
	def is_prime(self,num):
		if num < 2:
			return "False"
		for i in range(2, num):
			if (num % i) == 0:
				return 'False'
		return 'True'
		
print "Para saber si un numero es primo (True) o no (False)"

resp = "si"

#bucle while que nos ayuda a preguntar si se quiere realizar de nuevo
while resp == "s" or resp == "si":

    pc = prime_class()   # instanciacion de la clase
    n1 = int(input("Ingresa un numero: "))
    print pc.is_prime(n1)
    print ("Quieres calcular de nuevo? (si o no)")
    resp = raw_input()
    
else:
	""
