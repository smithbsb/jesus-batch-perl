#/bin/bash


if [ $# -lt 1 ]; then
    echo " "
    echo " "
    echo "    Faltou parametro, tente novamente passando o path:"
    echo " "
    echo "        ex: ./run.sh '/opt/jesus'";
    echo " "
    echo " "
    exit 1;
else
    perl $1/main/jesus.main.pl $1
fi

