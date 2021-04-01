$account = Read-Host -Prompt 'What is the account you want to search for?'
get-aduser $account -properties *
