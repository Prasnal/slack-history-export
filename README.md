this is fork of https://github.com/andxyz/slack-history-export


- step 1 visit https://api.slack.com/docs/oauth-test-tokens and click "generate-test-token"


- step 2 check https://api.slack.com/tokens

- step 3 set your token as env variable ``` export TOKEN=<your token here>```

- step 4 run initial script ``` bash start.sh ```

you need to wait until all data from the slack will be retrieved. You can find your messages on files that include `_full_history.txt` on the name.
Those files are in /base_jsons/ catalogs inside the channels/private_channels/direct_messages catalogs.

- step 5 set main script in crontab 
``` crontab -e
0 8 * * * bash <path to catalog>/main.sh
```
