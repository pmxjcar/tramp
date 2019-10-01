#!/bin/bash
IMAGETYPE=$1
VERSION=$2
DOMAIN=$3
PUBLISH=$4


build(){

   cd $1
   echo $VERSION > VERSION
   echo "Adding domain $DOMAIN"
   sed -i "s/<domain>/$DOMAIN/g" Dockerfile
   echo "Building $1 image"
   docker image build -t $DOMAIN/$1:$VERSION -t $DOMAIN/$1:latest  .
   echo "$1 image built"
   
   # Clean up 
   echo "Resetting domain"
   sed -i "s/$DOMAIN/<domain>/g" Dockerfile
   
   rm -f VERSION

   if [ $PUBLISH ]
   then
      echo "Publishing image"
      docker push $DOMAIN/$1
   fi
   cd ..

}


if [ -z "$IMAGETYPE" ]
then
      echo "No language type entered"
      echo "Available languages are:"
      echo "- clojure"
      echo "- elixir"
      echo "- elm"
      echo "- fsharp"
      echo "- go"
      echo "- haskell"
      echo "- idris"
      echo "- kotlin"
      echo "- ocaml"
      echo "- python3"
      echo "- r"
      echo "- rust"
      echo "- scala"
      echo "- unison"
      exit 1;
fi

CURRENT=${PWD}
echo $CURRENT
cd $CURRENT

build development
# cd development 
# docker image build -t development:$VERSION -t development:latest  .
# cd ..

case $IMAGETYPE in 
"clojure")
   build javajdk
   build clojure
   ;;
"development")
   build development
   ;;
"elixir")
    build elixir
   ;;
"elm")
    build elm
   ;;
"fsharp")
   build fsharp
   ;;
"go")
   build go
   ;;
"haskell")
     build haskell
   ;;
"idris")
     build idris
   ;;
"javajdk")
   build javajdk
   ;;
"kotlin")
   build javajdk
   build kotlin
   ;;
"ocaml")
   build ocaml
   ;;
"python3")
   build python3
   ;;
"r")
   build r
   ;;
"rust")
   build rust
   ;;
"scala")
   build javajdk
   build scala
   ;;
"unison")
   build unison
   ;;
"all")
   build javajdk
   build clojure
   build elixir
   build elm
   build fsharp
   build go
   build haskell
   build idris
   build kotlin
   build ocaml
   build python3
   build r
   build rust
   build scala
   build unison
   ;;

esac

echo "Images built"

   

   
  
