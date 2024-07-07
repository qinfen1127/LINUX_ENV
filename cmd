set current=`date +%Y_%m_%d_%H_%M_%S`
mv  ~/.cshrc      ~/.cshrc.$current
mv  ~/.vimrc      ~/.vimrc.$current
mv  ~/.vim        ~/.vim.$current
cp  cshrc         ~/.cshrc
cp  vimrc         ~/.vimrc
cp  vim           ~/.vim  -rf
mkdir -p          ~/script
cp  script/*      ~/script/ -rf
