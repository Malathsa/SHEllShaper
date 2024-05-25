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
       4) echo -n "Enter your File name: "
        read fileName 
        if [ -f "$fileName" ]; then
            choice=1
            while [ $choice != 6 ]
            do
                echo -e " 1.Print file content \n 2.Count number of lines \n 3.Move it content to another file \n 4.Search/Replace a word \n5.Edit the permissions of a file     \n-6.Exit"
                echo -n "Enter your choice NUMBER please: "
                read choice
                echo "Sure! on it..."
                    if [ "$choice" != "6" ]; then
                    case "$choice" in
                    1) cat "$fileName" 
                        echo -e "That is your file content ! \n------------------------ \nanything else?" ;;
                    2) wc -l $fileName
                        echo -e "That is your file lines number ! \n------------------------ \nanything else?" ;;
                    3) echo -n "Enter the file name that you want to move into: "
                        read destination_file
                        if [ $fileName == $destination_file ]; then
                            echo -n "It is already there! if were mistaken, enter again:"
                            read destination_file
                        else
                            cat $fileName >> "$destination_file"
                        fi
                        echo -e "Is is done ! \n------------------------ \nanything else?" ;;
                    4) 
                        while [ "$choice2" != "6" ]
                        do
                        echo -n " Search for a line that have: \n1.Aword \n2.A word in the beging of a row. \n3.A word in the end of a row \n4.Replace a word. \n5.Print the first word with the number of each row. \n6.Exit"
                        echo -n "Enter your choice NUMBER please: "
                        read choice2
                        echo "Sure! on it..."
                        if [ "$choice2" != "6" ]; then
                        case "$choice2" in
                        1) echo "Enter the word to search: "
                            read word
                            grep -n "$word" $fileName
                            echo "It is done! \nif no content shows up, the the word you are searching for is not existing.\n------------------------ \nanything else?";;
                        2) echo "Enter the word to search at the beginning of a row: "
                            read word
                            grep -i "^$word" $fileName
                            echo "It is done! \nif no content shows up, the the word you are searching for is not existing.\n------------------------ \nanything else?";;
                        3) echo "Enter the word to search at the end of a row: "
                            read word
                            grep "^$word$" $fileName
                            echo "It is done! \nif no content shows up, the the word you are searching for is not existing.\n------------------------ \nanything else?";;
                        4) echo "Enter the word to replace: "
                            read old_word
                            echo "Enter the new word: "
                            read new_word
                            sed "s/$old_word/$new_word/g" $fileName
                            echo -e "It is done! ! \n------------------------ \nanything else?";;
                        5)
                            awk '{print NR ". " $1}' $fileName
                            echo "You can check now by going to 4.I want to Edit an existing File then 1.Print file content. \nanything else?";;
                        *) echo -e "Sorry but this is not on our list! would you enter again:" ;;
                        esac
                        else
                            echo "Exiting.."
                        fi
                        done
                    ;;
                    5) echo "File permission configuration"
                        echo "--------------------------------"
                        echo "Do you want to give read permission? (y/n): "
                        read read_permission
                        echo "Do you want to give write permission? (y/n): "
                        read write_permission
                        echo "Do you want to give execute permission? (y/n): "
                        read execute_permission

                        permission=""

                        if [ "$read_permission" == "y" ]; then
                            permissions+="r"
                        fi

                        if [ "$write_permission" == "y" ]; then
                            permissions+="w"
                        fi

                        if [ "$execute_permission" == "y" ]; then
                            permissions+="x"
                        fi

                        chmod "$permissions" $fileName
                        echo "File permissions set successfully."
                        echo -e "It is done! ! \n------------------------ \nanything else?";;
            *) echo -n -e "Sorry but this is not on our list! would you enter again: \n" ;;
         esac
      fi
done 
