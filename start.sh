#!/bin/bash
pipenv run python slack_history.py --token=$TOKEN

mkdir ./channels/base_jsons/

for filename in ./channels/*.json; do
    #echo $filename
    new_path=${filename/channels/'channels/base_jsons'}
    #echo $new_path
    new_filename=${new_path/.json/_base.json}
    history_filename=${new_path/.json/_full_history.txt}
    echo $new_filename
    cp $filename $new_filename
    cp $filename $history_filename
    #cp $filename ./channels/base_json/
done


mkdir ./direct_messages/base_jsons/

for filename in ./direct_messages/*.json; do
    #echo $filename
    new_path=${filename/direct_messages/'direct_messages/base_jsons'}
    #echo $new_path
    new_filename=${new_path/.json/_base.json}
    history_filename=${new_path/.json/_full_history.txt}

    echo $new_filename
    cp $filename $new_filename
    cp $filename $history_filename

    #cp $filename ./channels/base_json/
done

mkdir ./private_channels/base_jsons/

for filename in ./private_channels/*.json; do
    #echo $filename
    new_path=${filename/private_channels/'private_channels/base_jsons'}
    #echo $new_path
    new_filename=${new_path/.json/_base.json}
    history_filename=${new_path/.json/_full_history.txt}
    echo $new_filename
    cp $filename $new_filename
    cp $filename $history_filename

    #cp $filename ./channels/base_json/
done


