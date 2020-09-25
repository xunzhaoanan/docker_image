#!bin/bash

rm -rf ./code.tar.gz
mkdir code
cp -r ~/programs/qrain-app/tencentcloud-adapter-oac/. ./code
cd ./code
tar -zcvf code.tar.gz ./.
mv ./code.tar.gz ../
cd ../
rm -rf ./code
