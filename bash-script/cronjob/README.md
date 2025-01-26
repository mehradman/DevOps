# Random Number Generator Script

This script generates a random number between 1 and 6 `every second` for a total of 59 iterations, appending each number to a file named `random-num.txt`.

## How to Use

1. Save the script as `random-num-generator.sh`:

2. Make the script executable by running the following command:

    ```bash
    chmod +x ./random-num-generator.sh
    ```

3. To run the script manually, use the following command:

    ```bash
    ./random-num-generator.sh
    ```

## Adding to Crontab

To schedule the script to run every minute, follow these steps:

1. Open the crontab file for editing:

    ```bash
    crontab -e
    ```

2. Add the following line to the crontab file:

    ```bash
    * * * * * /path/to/random-num-generator.sh
    ```

    Replace `/path/to/random-num-generator.sh` with the actual path to your script file.

3. Save and close the crontab file.

Now, the script will run every minute, generating random numbers and appending them to `random-num.txt`.
