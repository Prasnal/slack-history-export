#!/bin/bash

pipenv run python slack_history.py --token=$TOKEN

for filename in ./channels/*.json; do
    new_path=${filename/channels/'channels/base_jsons'}
    new_filename=${new_path/.json/_base.json}
    diff_filename=${new_path/.json/_diff.json}
    diff $new_filename $filename | grep '^>' | sed 's/^>\ //' > $diff_filename
    history_file=${new_path/.json/_full_history.txt}
    echo diff: $diff_filename history: $history_file new_filename: $new_filename
    cat $diff_filename $history_file | tee $history_file
    cp $filename $new_filename
done


for filename in ./private_channels/*.json; do
    new_path=${filename/private_channels/'private_channels/base_jsons'}
    new_filename=${new_path/.json/_base.json}
    diff_filename=${new_path/.json/_diff.json}
    diff $new_filename $filename | grep '^>' | sed 's/^>\ //' > $diff_filename
    history_file=${new_path/.json/_full_history.txt}
    echo diff: $diff_filename history: $history_file new_filename: $new_filename
    cat $diff_filename $history_file | tee $history_file
    cp $filename $new_filename
done

for filename in ./direct_messages/*.json; do
    new_path=${filename/direct_messages/'direct_messages/base_jsons'}
    new_filename=${new_path/.json/_base.json}
    diff_filename=${new_path/.json/_diff.json}
    diff $new_filename $filename | grep '^>' | sed 's/^>\ //' > $diff_filename
    history_file=${new_path/.json/_full_history.txt}
    echo diff: $diff_filename history: $history_file new_filename: $new_filename
    cat $diff_filename $history_file | tee $history_file
    cp $filename $new_filename
done


