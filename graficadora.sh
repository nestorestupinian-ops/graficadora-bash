#!/bin/bash

while true
do

echo "================================"
echo "           Graficadora========="
echo "==============================="
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicación"
echo "4. Divicion"
echo "5. Potencia"
echo "6. Raiz cuadrada"
echo "7. Evaluar funcion"
echo "8. Tabla de valores"
echo "9. Resolver ecuacion"
echo "10. Graficar funcion"
echo "11. Salir"
echo "=============================="
echo "Seleccione una opcion"
read opcion

case $opcion in

   1)
     echo "Ingresa el primer numero:"
     read numero1

     echo "Ingresa el segundo numero:"
     read numero2

     resulatdo=$(echo "scale=2; $numero1 + $numero2" | bc)

     echo "Resultado: $resultado"
    ;;

   2)
     echo "Ingresa el primer numero:"
     read numero1

     echo "Ingresa el segundo numero:"
     read numero2

     resultado=$(echo "scale=2; $numero1 - $numero2" | bc)

     echo "Resultado: $resultado"
    ;;

   3)
    echo "Ingresa el primer numero"
    read numero1
    
    echo "Ingresa el segunado numero"
    read numero2

    resultado=$(echo "scale=2; $numero1 * $numero2" | bc)

    echo "Resultado: $resultado"
    ;;

    4)
    echo "Ingrese el primer numero:"
    read numero1

    echo "Ingrese el segundo numero:"
    read numero2

    if [ "$numero2" = "0" ]; then
        echo "Error: no se puede dividir entre cero."
    else
        resultado=$(echo "scale=2; $numero1 / $numero2" | bc -l)
        echo "Resultado: $resultado"
    fi
    ;;

    5)
    echo "Ingresa la base:"
    read base

    echo "Ingresa el exponente:"
    read exponente

    resultado=$(echo "scale=2; $base ^ $exponente" | bc)

    echo "Resultado: $resultado"
    ;;

    6)
    echo "Ingrese el numero:"
    read numero

    if (( $(echo "$numero < 0" | bc -l) )); then
        echo "Error: no se puede calcular la raiz cuadrada de un numero negativo."
    else
        resultado=$(echo "scale=2; sqrt($numero)" | bc -l)
        echo "Resultado: $resultado"
    fi
    ;;

     7)
      echo "Ingresa la funcion usando x:"
      echo "Ejemplo: x^2 + 2*x -3"
      read funcion

      echo "Ingresa el valor de x:"
      read x

      expresion=$(echo "$funcion" | sed "s/x/($x)/g")

      resultado=$(echo "scale=2; $expresion" | bc -l)
      
     echo "Resultado: $resultado"
     ;;
   8)
    echo "Ingrese la funcion usando x:"
    echo "Ejemplo: x^2 + 2*x - 3"
    read funcion

    echo "Ingrese el valor inicial de x:"
    read inicio

    echo "Ingrese el valor final de x:"
    read fin

    echo "=========================="
    echo "       TABLA DE VALORES"
    echo "=========================="

    for ((x=inicio; x<=fin; x++))
    do
        expresion=$(echo "$funcion" | sed "s/x/($x)/g")
        resultado=$(echo "scale=2; $expresion" | bc -l)

        echo "x = $x    y = $resultado"
    done
    ;;

9)
    echo "================================"
    echo "       RESOLVER ECUACION"
    echo "================================"
    echo "Forma de la ecuacion: ax + b = c"
    echo ""

    echo "Ingrese el valor de a:"
    read a

    echo "Ingrese el valor de b:"
    read b

    echo "Ingrese el valor de c:"
    read c

    if [ "$a" = "0" ]; then
        echo "Error: a no puede ser 0"
    else
        resultado=$(echo "scale=2; ($c - $b) / $a" | bc -l)

        echo ""
        echo "Ecuacion: ${a}x + $b = $c"
        echo "Resultado: x = $resultado"
    fi
    ;;

     10)
    echo "================================"
    echo "       GRAFICAR FUNCION"
    echo "================================"

    echo "Ingrese la funcion usando x:"
    echo "Ejemplo: x^2"
    read funcion

    echo "Ingrese el valor inicial de x:"
    read inicio

    echo "Ingrese el valor final de x:"
    read fin

    echo ""
    echo "Grafica:"
    echo ""

    for ((x=inicio; x<=fin; x++))
    do
        expresion=$(echo "$funcion" | sed "s/x/($x)/g")
        y=$(echo "scale=0; $expresion" | bc -l)

        printf "x=%3d | " "$x"

        if [ "$y" -gt 0 ] 2>/dev/null; then
            for ((i=0; i<y; i++))
            do
                printf "*"
            done
        elif [ "$y" -eq 0 ] 2>/dev/null; then
            printf "*"
        else
            printf "-"
        fi

        echo ""
    done
    ;;

     11)
      echo "Saliendo de la graficadora..."
      break
      ;;
  
      *)
       echo "Opcion no valida"
      ;;

     esac
     
     echo ""
     echo "Presione Enter para continuar..."
     read

done

