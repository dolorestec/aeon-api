# aeon-api

#### Local SSL Cert
Generate local cert
- Generate a private key
    ```bash
    openssl genrsa -out /PATH/TO/SAVE/KEY/localhost.priv
    ```
- Generate Cert with key
    ```bash
    openssl req -x509 -new -nodes -key /PATH/TO/SAVE/KEY/localhost.priv -sha256 -days 365 -out /PATH/TO/SAVE/PEM/localhost.pem
    ```
- Copy crt file
    ```bash
    cp /PATH/TO/SAVE/PEM/localhost.pem /PATH/TO/SAVE/CRT/localhost.crt
    ```

- Register cert
    ```bash
    # Manjaro
    sudo trust anchor /PATH/TO/SAVE/CRT/localhost.crt
    sudo update-ca-trust

    # Ubuntu
    sudo cp /PATH/TO/SAVE/CRT/localhost.crt /usr/local/share/ca-certificates/extra/localhost.crt
    sudo update-ca-certificates
    ```


#### Postgres
Configure a local env.
- Up containers with postgres and pgAdmin
    ```bash
    docker compose -f docker-compose.develop.yml up -d
    ```
- Get postgres container ip
    ```bash
    docker inspect aeondb | grep "IPAddress"
    ```
- Go to: http://localhost:5050/login?next=/browser/ and log with credentials.
- Register server on pgAdmin
