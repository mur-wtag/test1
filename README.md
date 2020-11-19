# Test project

1. create a file `config/credentials/development.key` and set value: `905e876ce5168094e3cac0695fcdba13`
2. run these command to root directory of this project
```bash
bundle
rake db:create
rake db:migrate
yarn install
```
3. run rails server: `rails s`
4. to run `mailchatcher` run:
```
mailcatcher
```
received mails could be found here: http://127.0.0.1:1080

*Thanks!*

### Problem Details
Your application manage real estate, you have several types of assets you want to display:

    Houses
    Complex Buildings
    Commercial Units

They're very similar, but there are some differences, see asset_fields.txt for a description of the models.

Write a simple Rails app* that allow managers (permissions are not important) to add items to the list of assets, they can also attach pictures. On the root page of the app users (they don't have to be logged) can see the list of items ordered by creation date: a single list that include all three types of assets. A user can buy an asset clicking a button, when this happens a special very long task needs to be executed (implemented in the file very_long_task.rb attached here), once the task is completed an email message must be sent to both the user and the owner confirming the success of the operation.