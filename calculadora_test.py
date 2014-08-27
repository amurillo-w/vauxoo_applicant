#! /usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------------
'''
Generar un programa python que le pida al usuario números 
por medio de consola. Posteriormente instanciar la clase 
calculadora_class del archivo calculadora.py para mandar a llamar 
el método sum, con todos los números ingresados por el usuario.
Los números que puede ingresar el usuario, son a petición 
del mismo usuario.
'''

from calculator import calculator_class

lista = []
while True:
   numero = int(input('Introduce un número (-1 para terminar):'))
   if numero == -1:
      break
   if numero != -1:
      lista.append(numero)

#Se crea un objeto (obj) para llamar el metodo sumar de la clase calculator_class
obj = calculator_class()

print obj.sumar(lista)

