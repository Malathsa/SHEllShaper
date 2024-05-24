echo -e "Welcome to SHEllShaper FILE EDITOR AND ANALYZER! \nHow can we serve you? "
input=1
while [ $input != 5 ]
do
echo -e -n " 1.I want to make a Directory \n 2.I want to make a File \n 3.I want to Edit an existing Directory \n 4.I want to Edit an existing File \n 5.Exit \nEnter your choice NUMBER please: "
      read input
      echo "Sure! on it..."
      if [ "$input" != "5" ]; then
      case "$input" in
      1) echo -n "Enter your Directory name: "
         read dirName
         mkdir "$dirName" 
         echo -e "It is Done ! \n------------------------ \nanything else?" ;;
      2) echo -n "Enter your File name: "
         read fileName
         touch "$fileName" 
         echo -e "It is Done ! \n------------------------ \nanything else?" ;;
      3) echo -n "Enter your Directory name: "
         read dirName 
         if [ -d "$dirName" ]; then
         dirChoice=1
         while [ $dirChoice != 3 ]
         do
            echo -e -n " 1.List it content \n 2.Create a file in it \n 3.Exit\nEnter your choice NUMBER please: "
            read dirChoice
            echo "Sure! on it..."
            if [ "$choice" != "3" ]; then
            case "$dirChoice" in
            1) ls -l $dirName
               echo -e "It is Done ! \n------------------------\nanything else?" ;;
            2) echo -n "Enter your file name: "
               read DFName 
               cd $dirName
               touch $DFName
               echo -e "It is Done ! \n------------------------\nanything else?" ;;
            *) echo -e "Sorry but this is not on our list! would you enter again:" ;;
               esac
             fi
         done
         else 
         echo "Directory not found"
         fi
         echo -e "\n------------------------\nanything else?" ;;
       *) echo -n -e "Sorry but this is not on our list! would you enter again: \n" ;;
          esac
       fi
done
