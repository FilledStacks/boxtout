# Box't Out

An open source food delivery product and service that will be developed on the [FilledStacks YouTube channel](https://youtube.com/playlist?list=PLdTodMosi-BzqMe7fU9Bin3z14_hqNHRA). The repo will contain all the software required to run the open source Box't Out food delivery product. This is not a "product for a tutorial", this will be an actual product. It just so happens that I'll be making a tutorial and video for every part of it that is developed as well as make all the code available through this repository.

## Setup

The source code to run the product can be found in the `src/` folder. The code is split into two major sections, backend and clients. The backend folder contains firebase code required to run the backend. Clients are the front facing clients that will be connected to the backend.

### Customer App

While Boxtout will integrated PlacesAPI and that will require us an API key so we will need a safe place to store the API key. We can do that by using `.env` file with `flutter_dotenv` package.

It is required to copy `.env.example` to a new file called `.env` and add values to the following keys.

Navigate into the customer application directory,
```bash
cd src/clients/customer
```

And then copy the `.env.example` and create a new file with the following command,
```bash
cp .env.example .env
```

Then open up `.env` file and add the values with those keys.

