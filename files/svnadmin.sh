#!/bin/bash

# vars
BACKUP_DIR1=/svn/dump/
BACKUP_DIR2=/svn/

#Listing DB
rm -f /tmp/list.txt && echo 'updated svn list'
ls ${BACKUP_DIR1} > /tmp/list.txt

cd /tmp/
sed 's/.dump//g' list.txt | tee list.txt

#SVN Backup Repos

# Svn Restore repos
cd ${BACKUP_DIR2}
for file in $(</tmp/list.txt); do rm -rf $file && svnadmin create $file && svnadmin load $file < ${BACKUP_DIR1}/$file.dump  ; done



