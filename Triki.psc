Algoritmo Triki
    Dimension triqui(3,3);
    Para i<-1 Hasta 3 Con Paso 1 Hacer
        Para j<-1 Hasta 3 Con Paso 1 Hacer
            triqui[i,j] <- ' ';
        FinPara
    FinPara
    ganador <- ' ';
    juega_cpu <- AZAR(2)=1;
    turnos <- 0;
    Mientras turnos<9 Y ganador <> 'O' Y ganador <> 'X' Hacer
        Si juega_cpu Entonces
            Repetir
                i <- 1+AZAR(3);
                j <- 1+AZAR(3);
            Hasta Que triqui[i,j] = ' ';
            triqui[i,j] <- 'O';
        Sino
            imprimir_cuadricula(triqui);
            Repetir
                i <- leer_numero("renglón");
                j <- leer_numero("columna");
                Si triqui[i,j] <> ' ' Entonces
                    Escribir "La casilla seleccionada ya está ocupada.";
                    Escribir "";
                FinSi
            Hasta Que triqui[i,j] = ' ';
            triqui[i,j] <- 'X';
        FinSi
        i <- 1;
        Mientras ganador = ' ' Y i <= 3 Hacer
            Si triqui[i,1] <> ' ' Y triqui[i,1] = triqui[i,2] Y triqui[i,2] = triqui[i,3] Entonces
                ganador <- triqui[i,1];
            FinSi
            i <- i + 1;
        FinMientras
        i <- 1;
        Mientras ganador = ' ' Y i <= 3 Hacer
            Si triqui[1,i] <> ' ' Y triqui[1,i] = triqui[2,i] Y triqui[2,i] = triqui[3,i] Entonces
                ganador <- triqui[1,i];
            FinSi
            i <- i + 1;
        FinMientras
        Si ganador = ' ' Y triqui[1,1] <> ' ' Y triqui[1,1] = triqui[2,2] Y triqui[2,2] = triqui[3,3] Entonces
            ganador <- triqui[1,1];
        FinSi
        Si ganador = ' ' Y triqui[1,3] <> ' ' Y triqui[1,3] = triqui[2,2] Y triqui[2,2] = triqui[3,1] Entonces
            ganador <- triqui[1,3];
        FinSi
        juega_cpu <- No juega_cpu;
        turnos <- turnos + 1;
    FinMientras
    imprimir_cuadricula(triqui);
    Segun ganador Hacer
        'O':
            Escribir "La computadora ha ganado.";
        'X':
            Escribir "El usuario ha ganado.";
        ' ':
            Escribir "Empate.";
    FinSegun
FinAlgoritmo

SubProceso imprimir_cuadricula(triqui)
    Borrar Pantalla;
    Escribir "      +---+---+---+";
    Escribir "      | 1 | 2 | 3 |";
    Escribir "      +---+---+---+";
    Escribir "";
    Escribir "+-+   +---+---+---+";
    Para i<-1 Hasta 3 Con Paso 1 Hacer
        Si i <> 1 Entonces
            Escribir "+-+   +---+---+---+";
        FinSi
        Escribir Sin Saltar "|", i, "|   |";
        Para j<-1 Hasta 3 Con Paso 1 Hacer
            Escribir Sin Saltar " ", triqui[i,j], " |";
        FinPara
        Escribir "";
    FinPara
    Escribir "+-+   +---+---+---+";
    Escribir "";
FinSubProceso

SubProceso numero <- leer_numero(variable)
    Repetir
        Escribir Sin Saltar "Seleccione el número de ", variable, ":";
        Leer numero;
        Si numero<1 O numero>3 Entonces
            Escribir "Número no válido";
        FinSi
    Hasta Que numero=1 O numero=2 O numero=3;
FinSubProceso