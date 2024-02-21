# MMC - Monero Miner Container

This project provides a Docker container for mining Monero. 
It utilizes the XMRig miner to mine Monero and is configured to work with the MoneroOcean pool.

## Usage

1. Clone this repository to your local machine.
2. Edit the `.env` file in the same directory as the `docker-compose.yaml` and add your mining information:

    ```env
    # you can choose to use the default pool
    POOL_ADDRESS=your_pool_address 
    
    # but please change the wallet adress
    USER_ADDRESS=your_user_address 
    ```

3. Start the mining process with the following command:

    ```bash
    docker-compose up -d
    ```

Please note that mining cryptocurrencies requires significant computational resources and may incur high electricity costs. Ensure you understand the costs and benefits of mining before using this project.