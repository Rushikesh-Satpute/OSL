#!/bin/sh

echo "========== Patient Addrees Book =========="
echo "Enter file name:"

read filename
if [ -f $filename ]; then
echo "File Already Exists."
else
touch $filename
fi

while true
do
echo "+++++++++ PATIENT ADDRESS BOOK +++++++++"
echo "1.Create Address book"
echo "2.Insert Record"
echo "3.Display Record"
echo "4.Search Record"
echo "5.Delete Record"
echo "6.Modify Record"
echo "7.Exit"
echo "Enter Your Choice: "
read ch
case $ch in
1)
echo "========== Patient Addrees Book =========="
echo "Enter file name:"

read filename
if [ -f $filename ]
then
echo "file exists"
else
touch $filename
fi
echo "Address Book Created."
;;
2)
echo "Enter no of records you want to insert"
read n
echo "patientId Name Mobile_No email_id Address"
while [ $n -ne 0 ]
do
read a
echo $a >> $filename
n=`expr $n - 1`
done
echo "Data inserted successfully."
;;
3)
echo "Patient address book: "
echo "patientId Name Mobile_No email_id Address"
cat $filename
;;
4)
echo " Enter patientId for search: "
read s
echo "patientId Name Mobile_No email_id Address"
grep "^$s" $filename
echo "Record Found....!"
;;
5)
echo "Enter patientId to delete: "
read s
sed -i "$(grep -n "^$s" $filename | cut -f1 -d:)"d $filename
echo "Record Deleted"
;;
6)
echo "Enter patientId to modify: "
read s
echo "Enter new record"
echo "patientId Name Mobile_No email_id Address"
read r
sed -i "/$(grep -i "^$s" $filename)/c $r" $filename
echo "Records Updated."
;;
*) break ;;
esac
done
