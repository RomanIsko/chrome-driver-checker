### Chromedriver-checker 
The Chromedriver-checker is the simplem Shell script written to automate the checking newer version of Chromedriver available at [http://chromedriver.storage.googleapis.com/](http://chromedriver.storage.googleapis.com/index.html) and notify about that the user.

Note: you may add the execution of the following script to the Cron with the following commands in terminal:

* `crontab -e`
* add this line `*/30 * * * * /path/to/chrome_driver_checker.sh` to perform check each half hour
* close Nano editor with `Ctrl+X`
* confirm saving the new task for Cron `Y`
* expected result `crontab: installing new crontab`

**Note:** each script execution performs the request to the remote server. So make sure you have an access to the [http://chromedriver.storage.googleapis.com/](http://chromedriver.storage.googleapis.com/index.html) and be careful with frequency of requests.
