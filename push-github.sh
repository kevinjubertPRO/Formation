#!bin/bash

echo "Commit Pending..."

read -p "Commit message: " commt_message
read -p "Git path: " git_path


git add .
git commit -m  $message
git branch -M main
git remote ad origin $git_path
git push -u orgin main

echo "Task completed"