#!/bin/bash

#CREO LA CARPETA INSTABOT DONDE VA A ESTAR TODO
mkdir ./InstaBot
cd InstaBot

#INSTALO LAS DEPENDENCIAS
sudo apt-get install python
sudo apt-get install python-pip
pip install beautifulsoup4

#CLONO ESTE REPOSITORIO PARA DESCARGAR IMAGENES DE REDDIT
sudo git clone https://github.com/HoverHell/RedditImageGrab.git
sudo git clone https://github.com/2018-vn-group-19/Instagram-API-python.git

cd Instagram-API-python
pip install -r requirements.txt
pip install InstagramApi

while true;
do 

cd .. 
cd RedditImageGrab

sudo python redditdl.py dankgentina dank --sort-type new  --num 5

cd dank

#RENOMBRO TODAS LAS IMAGENES
a=1
for i in *.jpg; do
  new=$(printf "%04d.jpg" "$a") #04 pad to length of 4
  mv -i -- "$i" "$new"
  let a=a+1
done

cd ..
cd ..

sudo mv RedditImageGrab/dank/ Instagram-API-python/examples/ 

cd Instagram-API-python
cd examples

python upload_photo.py

sleep 10h

done








