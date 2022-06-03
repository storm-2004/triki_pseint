Algoritmo ProcesoTicTacToe
    Dimension tictactoe(3,3);
    Para i<-1 Hasta 3 Con Paso 1 Hacer
        Para j<-1 Hasta 3 Con Paso 1 Hacer
            tictactoe[i,j] <- ' ';
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
            Hasta Que tictactoe[i,j] = ' ';
            tictactoe[i,j] <- 'O';
        Sino
            imprimir_cuadricula(tictactoe);
            Repetir
                i <- leer_numero("renglón");
                j <- leer_numero("columna");
                Si tictactoe[i,j] <> ' ' Entonces
                    Escribir "La casilla seleccionada ya está ocupada.";
                    Escribir "";
                FinSi
            Hasta Que tictactoe[i,j] = ' ';
            tictactoe[i,j] <- 'X';
        FinSi
        i <- 1;
        Mientras ganador = ' ' Y i <= 3 Hacer
            Si tictactoe[i,1] <> ' ' Y tictactoe[i,1] = tictactoe[i,2] Y tictactoe[i,2] = tictactoe[i,3] Entonces
                ganador <- tictactoe[i,1];
            FinSi
            i <- i + 1;
        FinMientras
        i <- 1;
        Mientras ganador = ' ' Y i <= 3 Hacer
            Si tictactoe[1,i] <> ' ' Y tictactoe[1,i] = tictactoe[2,i] Y tictactoe[2,i] = tictactoe[3,i] Entonces
                ganador <- tictactoe[1,i];
            FinSi
            i <- i + 1;
        FinMientras
        Si ganador = ' ' Y tictactoe[1,1] <> ' ' Y tictactoe[1,1] = tictactoe[2,2] Y tictactoe[2,2] = tictactoe[3,3] Entonces
            ganador <- tictactoe[1,1];
        FinSi
        Si ganador = ' ' Y tictactoe[1,3] <> ' ' Y tictactoe[1,3] = tictactoe[2,2] Y tictactoe[2,2] = tictactoe[3,1] Entonces
            ganador <- tictactoe[1,3];
        FinSi
        juega_cpu <- No juega_cpu;
        turnos <- turnos + 1;
    FinMientras
    imprimir_cuadricula(tictactoe);
    Segun ganador Hacer
        'O':
            Escribir "La computadora ha ganado.";
        'X':
            Escribir "El usuario ha ganado.";
        ' ':
            Escribir "Empate.";
    FinSegun
FinAlgoritmo

SubProceso imprimir_cuadricula(tictactoe)
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
            Escribir Sin Saltar " ", tictactoe[i,j], " |";
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