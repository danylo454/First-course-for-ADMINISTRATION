#! /bin/bash
clear

source proek.add

function Menu(){

	echo -e "1.Show list of all groups\n2.Show group no name\n3.Show list of all users\n4.Show users by name\n5.Create new group\n6.Edit group\n7.Delete group\n8.Create user\n9.Edit user\n10.Delete user with all files\n0.Exit"
	read version

	case "$version" in
		1) List; ;;
		2) ListName; ;;
		3)ListAllUsers; ;;
		4)ListUser; ;;
		5)AddNewGroup; ;;
		6)GroupEdit; ;;
		7)DelGroup; ;;
		8)AddUser; ;;
		9)UserEdit; ;;
		10)UserDel; ;;
		0) let exit=1; echo " =) Bye (= " ;;
		*) echo "Wrong choice." ;;
	esac
}

let exit=0
while [[ $exit == 0 ]]
do
	Menu;
done

