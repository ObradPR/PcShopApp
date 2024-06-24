
# PcShop

PcShopApp is a full-stack web application designed for a PC shop franchise with multiple stores across Serbia. This application serves both as an e-commerce platform and an informational site for the company. Built with Angular 2, Node.js and SQL Server, the app offers a variety of features to enhance the shopping experience and provide essential store information.




## Features

- **E-commerce Funtionality:** Browse and purchase a wide range of PC products.
- **Store Locator:** Find stores using an interactive map powered by the Leaflet library.
- **User Accounts:** Create and manage user accounts for personalized shopping.
- **Wishlist:** Add products to wishlist for future purchase.
- **Order Management:** Place and track orders easily.


## Tech Stack

**Client:** Angular v16.1.0

**Server:** Node.js v20.14.0

**Database:** SQL Server 2022 | Microsoft SQL Server Management Studio 19.1


## Prerequisites

Before trying to run the application make sure that you have installed prerequisites for the project and that you have set up everything nicely, so that application can work without problems.

1. **Angular Client App SSL Configuration**

This app is using client certificate for running Angular app on HTTPS protocol.
If you don't want that, you can just turn off the SSL option:

- Navigate to `angualr.json` file.
- Set `ssl` property to false.
```json
"architect": {
  "serve": {
    "options": {
      "ssl": false,
      "sslKey": "ssl/server.key",
      "sslCert": "ssl/server.crt"
    }
  }
}
```
If you are fan of running local app in environment as close as production, you just need to install client certificate for the application to work properly.

- Locate the server.crt file in your project folder.
You can find the certificate files at the following location:

    client
  
      ├── ssl
      │   ├── server.crt
      │   └── server.key
      ├── src
      ├── ...

- Double-click on the `server.crt` file to open the certificate.
- Click on "Install Certificate" to start the certificate import wizard.
- In the wizard, select "Local Machine" or "Current User" depending on your preference, andc click "Next".
- Choose "Place all certificates in the following store" and click "Browse".
- Select "Trusted Root Certification Authorities" and click "OK".
- Click "Next" to proceed with the installation.
- Review the details and click "Finish" to complete the installation process.

By following these steps, you can install the client certificate on your PC, allowing you to access your Angular application over HTTPS without encountering security warnings.

2. **SQL Server drivers**

For now you can skip this, but when you start your application (client, server, with executed script for creating database and all the Objects and Data) if you are encountering some weird error regarding ODBC driver/s. Please check what drivers you have and ensure that you have some from the following list, keep in mind that if you don't have some drivers from the list and the app is working perfectly then don't bother:

To see the drivers:
- Press `Win + R` on your keyboard to open the Run dialog.
- Type `odbcad32` and press `Enter`.
- In the ODBC Data Source Administrator window, go to the "Drivers" tab. This tab lists all the insstalled ODBC drivers on your system.
- Look for entries related to SQL Server, such as 
    - `ODBC Driver 17 for SQL Server`
    - `SQL Server`
    - `SQL Server Native Client 11.0`
    - `SQL Server Native Client RDA 11.0`
, or other similar names.
## Run Locally

1. Clone the project

```bash
  git clone https://github.com/ObradPR/PcShopApp.git
```

2. Go to the project directory

```bash
  cd my-project
```

3. Go to sql_sript directory

```bash
  cd sql_sript
```

4. Open `PcShopAppSQLServer22.sql` script with SSMS and execute it.

5. Install application dependencies

- Go to **client** directory
```bash
  cd client
  npm install
```
- Go to **server** directory
```bash
  cd server
  npm install
```
6. Change server to your local DB server as the parameter for db configuration inside `config.js` in `server` root directory
```javascript
exports.config = {
  server: "DESKTOP-HJV3RJ8\\SQLEXPRESS",
  database: "PcShop",
  driver: "msnodesqlv8",
  options: {
    trustedConnection: true,
  },
};

```

7. Start the server

```bash
  cd server
  nodemon server.js
```
8. Start the client

```bash
  cd client
  ng serve
```


## Demo

If you want to test the application you can register with your account, or use test account:

    Email:      obra@gmail.com
    Password:   Boba1234@

