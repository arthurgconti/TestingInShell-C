#!/bin/bash

making_directories() {

   echo -e "\n"
   echo "Done Preparing"
   sleep 0.3s
   clear

   echo ================
   echo Criar pastas
   echo ================

   mkdir diff res
   cd diff
   mkdir dif resul
   cd ..

   echo "Done making directories."
   sleep 0.5s
   clear
}

echo ================
echo Preparando...
echo ================

qnt=0
aqvr=0
make=0
finish=0

while getopts "a:t:if" OPTION; do
   case $OPTION in
   a)
      aqv=$OPTARG
      aqvr=1
      ;;
   t)
      qnt=$OPTARG
      ;;
   i)
      make=1
      ;;
   f)
      finish=1
      ;;
   esac
done

shift $((OPTIND - 1))

if (($finish == 1)); then

   echo "voce esta prestes a deletar todas as pastas geradas pelo programa, incluindo a pasta 'res', deseja continuar? y/n"
   read resp
   if [[(($resp = "y" || $resp = "Y"))]]; then
      rm -r diff res
      echo "remocao concluida!"
      sleep 0.3s
      clear
      exit
   fi
   
fi

if (($make==1)); then

   if  ! [[ (( -e "./res" && -e "./diff" && -e "./diff/dif" && -e "./diff/resul"))]]; then
      making_directories
      echo "Diretorios criados!"
      sleep 0.3s
      clear
      exit
   else
      echo "Diretorios ja criados!"
      sleep 0.3s
      clear
   fi
fi

if (($aqvr == 0)); then
   echo "coloque o nome do .c"
   read aqv
fi

if (($qnt == 0)); then
   echo "coloque a quantidade de testes"
   read qnt
fi

echo -e "\n"
echo "Done Preparing"
sleep 0.3s
clear


echo ================
echo Compilando...
echo ================
echo -e "\n"

gcc -std=c99 -pedantic -Wall -lm ./$aqv.c -o $aqv

echo "Done Compiling"
clear

echo ================
echo Testando sistema
echo ================
echo -e "\n"

for i in $(seq 1 $qnt); do
   ./$aqv <res/arq$i.in >diff/resul/t$i.txt
done

echo "Done Testing"
sleep 0.5s
echo Done

clear

echo ==================
echo Diferenciando...
echo ==================
echo -e "\n"

for i in $(seq 1 $qnt); do
   sdiff -s diff/resul/t$i.txt res/arq$i.res >diff/dif/diferenca$i.txt
   DIF=diff/dif/diferenca$i.txt

   if [ -s $DIF ]; then
      echo "Teste $i | resultado divergente: "
      echo "Seu resultado | Resultado esperado"
      cat diff/dif/diferenca$i.txt
      echo -e "\n"
   else
      echo Teste $i: Resultados Iguais!
   fi
done
echo -e "\n"
echo Done