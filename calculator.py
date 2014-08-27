#! /usr/bin/env python
# -*- coding: utf-8 -*-
'''
py2: Puedes realizar una clase en python llamada "calculator_class" 
que tenga un método llamado "sum" y que reciba como entrada una 
lista de números números y que de salida regrese la suma de los mismos.
'''
# Declaracion de la clase
class calculator_class:

   # metodo que realiza la suma de los elementos de una lista
   def sumar(self,lista):
      suma = 0 
      for i in lista:
         suma = suma + i
      return suma

# Lista inicializada con varios numeros       
l = [1,4,5,2,6,9]      
obj = calculator_class() # intanciacion de la clase 
print "La suma es :", obj.sumar(l)
