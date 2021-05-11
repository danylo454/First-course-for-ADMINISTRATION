#! /bin/bash
clear 
function ListAllUsers(){
clear
echo "This is all\n"
echo "=================================="
sudo less /etc/shadow
}
function List()
{
clear
 sudo less /etc/group

}
function ListName()
{
        clear
echo "==================================="
echo "Enter group name: "
read ListName
cat /etc/group | grep ListName
echo "==================================="
}
function ListUser()
{
        clear
        echo "==================================="
        echo "Enter user name: "
        read username
sudo less /etc/passwd | grep $username
echo "==================================="



function ListAllUsers(){
clear
echo "This is all\n"
echo "=================================="
sudo less /etc/shadow
}
function List()
{
clear
 sudo less /etc/group

}
function ListName()
{
	clear
echo "==================================="
echo "Enter group name: "
read ListName
cat /etc/group | grep ListName
echo "==================================="
}
function ListUser()
{
	clear
	echo "==================================="
	echo "Enter user name: "
	read username
sudo less /etc/passwd | grep $username
echo "==================================="


}

function AddNewGroup(){
	clear
	echo "==================================="
	echo -e "1)Create new group by name"
	echo -e "2)Create new group by name and GID"
	echo "==================================="
	echo -e "Enter select:"
	read key
	case "$key" in
		1) echo "Enter name group"
		read name
		sudo groupadd $name ;;
		2) echo "Enter name group"
		read name
		echo "Enter GID"
		read gid 
		sudo groupadd $name -g $gid ;;
	*) echo "Select true option"
esac

}

function GroupEdit()
{
echo "==================================="
echo "Edit group"
echo -e "1)Create name"
echo -e "2)Create GID"
read key
case "$key" in
	1) echo "Enter new name group"
		read newname
		echo "Enter old name"
		read oldname
	 sudo groupmod -n $newname $oldname ;;
	2)echo "Enter new GID"
		read gid
		echo "Enter name this group"
		read name 
		sudo groupmod -g $gid $name ;;

esac
}

function DelGroup()
{
	clear
echo "==================================="

echo "Enter group that you want delete: "
read del;
sudo groupdel $del

}

function AddUser()
{
	clear
echo "==================================="
echo -e "Select variant:"
echo -e "1)Add name user\n2)Add name and UID\n3)Add name and UID and GID:"
echo "==================================="
read variant
case "$variant" in
	1)echo "Enter new user"	
		read oldname
	       	sudo useradd $oldname ;;
	2) echo "Enter user name: "
		read name
		echo "Enter user UID"
		read uid
		sudo useradd -u $uid $name ;;
	3)echo "Enter user name: "
                read name
		echo "Emter user UID"
		read uid
		echo "Enter user GID"
		read gid
		sudo useradd -u $uid -g $gid $name;;


esac

}

function UserEdit()
{
 clear
echo "==================================="
echo -e "Select variant:"
echo -e "1)Add name user\n2)Add name and UID\n3)Add name and UID and GID:"
echo "==================================="
read variant
case "$variant" in
        1)echo "Enter user name: "
                read name
                sudo usermod $name ;;
        2) echo "Enter user name: "
                read name
                echo "Enter user UID"
                read uid
                sudo usermod -u $uid $name ;;
        3)echo "Enter user name: "
                read name
		echo "Enter user uid"
		read uid
                echo "Enter user GID"
                read gid
                sudo usermod -u $uid -g $gid $name ;;


	esac
}

function UserDel()
{
 clear
echo "==================================="
echo "Enter name user"
read user 
sudo userdel $user -r 
}
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
