# BoxtOut backend

This backend is completely written in Firebase. Most likely we'll be able to rebuild this using different backend providers if time allows or if it's a valuable addition to the series. This document goes over the setup of the backend and the rules / conventions established to ensure a scalable and maintainable backend setup.

## Overview

The biggest "drawback" with Firebase is that it deploys the exports from the singular index.js file. This means if you use it as recommended and you grow your functions added into the backend then you'll also be growing your index.js file. It will always have to be in sync for you to ensure you're deploying the newly added functions. We've setup a very basic, first version of a dynamic cloud functions and express api deployment using glob and some basic loops.

# The System

As described in our [System Technical Overview](https://github.com/FilledStacks/boxtout/wiki/System-Technical-Overview#backend-api-and-setup) we have identified two types of cloud functions.

- Reactive functions: Cloud functions that will only react to data changing on our system. Firestore collection updates, user auth changes etc.
- RESTful functions: Traditional RESTful HTTP API endpoints

The backend folder under `src` contains the entire firebase backend. The functions contains the business logic for the backend. In functions there's a `src` folder. This folder contains the 5 resource groups defined as folders and system folder which will contain code shared between all resources. In the `src` folder there is also an index file. In this file you'll see that we do two things.

1. We build the reactive functions
2. We build the RESTful API

This will keep our index file 4 lines long (for the time being) regardless of how many endpoints and functions we create.

## Dynamically exporting Reactive Function

A reactive function looks something like this

```ts
exports.onOrderCreated = functions.firestore
  .document('orders/{orderId}')
  .onCreate(async (snapshot) => {
    console.log(`order | orderId:${snapshot.id}`);
  });
```

What we're saying above is. Export a cloudFunction called `onOrderCreated`. This function should trigger when a document is created in the `orders/` collection. When that function triggers we print out the orderId of the document. Pretty basic, but a powerful concept. The way this is usually setup is by adding each of the functions to the exports in the index file. Firestore will then deploy those as standalone cloud functions. We've come up with something different. Lets look at how a cloud function is added into our backend.

1. Go to the resource folder you want to add a function to
2. In the `reactive` folder create a new file
3. Name the file the name of the function that will be exported (not important but recommended for maintenance tax on the memory).
   In the above scenario the file will be called `onOrderCreated.function.ts`. The `.function.ts` is important, more on this later
4. Place your function inside the file exported as shown above. The exported function name has to match the fileName as mentioned in #3.

That's it, there's nothing else you have to do. When you want to run the app you to build it then run it locally. You can do that by running the following commands inside the functions folder.

```
// Build the app
npm run build

// run locally
firebase emulators:start --only functions
```

If you don't have the emulators make [sure it's installed](https://firebase.google.com/docs/functions/local-emulator#install_the_firebase_cli). We'll be using it for basically all of the development.

### How does it work?

If you open up a file called `exportHelper.ts` you'll see in there is a function called `buildReactiveFunctions`. What this function does is quite simple, The idea I got from [this article by Tarik Huber](https://codeburst.io/organizing-your-firebase-cloud-functions-67dc17b3b0da).

1. It gets all relative file paths for any file that ends with `.function.js`. Which is why I mentioned its importance above.
2. It loops through all those files and gets the `groupName` and then the `functionName`.
3. Then it creates an exports group using the groupName
4. Every file under that group gets required and the export is added into the group

This means that when we add a new reactive function all we have to do it go to the resource folder, create the new file following the convention and then it'll automatically be added into the deployed functions! Pretty cool right. Well we have the same kind of setup for the RESTful functions.

## Dynamically adding RESTful Api Endpoints

Lets start off with how an endpoint looks in our system.

```ts
import { Request, Response } from 'express';
import { GetRequest } from '../../system/constants/requests';

exports.getMenuItems = (req: Request, res: Response) => {
  res.send({
    menuItems: [
      { id: 1, name: 'Steak with Jalepeno' },
      { id: 2, name: 'Kiwi and Yoghur bowl' },
    ],
  });
};

exports.requestType = GetRequest;
```

In the above code we define an endpoint called `getMenuItems` as well as a requestType providing the type of http endpoint we're defining. This endpoint will return a list of menuItems to us when called. This file will be deployed to a the groups resource giving the route of the endpoint **the same name as the file name**. Let go over how to add one of these into the backend then I'll go over how it works and gets to be deployed dynamically.

1. Go to the resource folder where you want to add a new endpoint
2. Under the `restful` folder create a new file called `getMenuItems.endpoint.ts`. The name of this file has to match **EXACTLY** the name of the endpoint. And this time it has to end in `.endpoint.ts`.
3. Place the code from above in the file and that's it.

The same thing applies for running locally and building. This time we'll use a built in command that performs the build and starts the emulator. Run the following in the functions folder.

```
npm run serve
```

In the logs you should see something like below.

```ts
i  functions[orders-onOrderCreated]: function ignored because the firestore emulator does not exist or is not running.
i  functions[orders-onOrderDeleted]: function ignored because the firestore emulator does not exist or is not running.
+  functions[orders-api]: http function initialized (http://localhost:5000/boxtout-production/us-central1/orders-api).
+  functions[payments-api]: http function initialized (http://localhost:5000/boxtout-production/us-central1/payments-api).
+  functions[products-api]: http function initialized (http://localhost:5000/boxtout-production/us-central1/products-api).
+  functions[tips-api]: http function initialized (http://localhost:5000/boxtout-production/us-central1/tips-api).
+  functions[users-api]: http function initialized (http://localhost:5000/boxtout-production/us-central1/users-api).
```

We've added the getMenuItems to the orders resrouces so open the url for `orders-api`. then at the end of it add `/getMenuItems`. That should return your response you defined. Crazy right! Also super cool! Also if you actually agree with that being cool and crazy we should be better friends, because that's very nerdy haha.

### How does it work?

This one is a bit more complicated than the reactive functions, but it's not that difficult to understand. If you open up the `ExportHelper` again you'll see a function called `buildRestfulApi`. That's where the magic lies.

1. It looks for all files ending in `.api.js`
2. It loops through them and gets the `groupName` out to be used
3. It creates an express application
4. We get the api file and set the base path to point to the router exported from that api file.
5. Then we pass that express app to the `onRequest` function which is called when our backend receives any kind of http request to the groups-api endpoint.

Now in number 4 there's actually an extra step. Open up the `_orders.api.ts` file. Here you'll see something similar to the `index.ts` file. Some weird boiler plate that creates a `BoxtOutApi`, gives it a name, calls build then exports the router from it. This is actually doing the same thing as the `ExportHelper` but for files ending in `.endpoint.js`. Open the `build` function from the `BoxtOutApi`. In here we do the following:

1. Get all the files ending in `.endpoint.js`
2. Get the functionName from the file. _This is why the function name **HAS** to match the endpoint name being exported_
3. Add a new router path using the function name above and then exported function
4. The router path type is determined by the exported `requestType` value.

And voila! Api endpoints auto magically exported to your backend!

## Why is this so important?

Are you really asking this question? The answer should be obvious by now. LOOONG --- TERM --- MAINTENANCE. That's what we're aiming for when building this system. Regardless of the "limitations" developers believe firebase has that has nothing to do with us at this point. We've chosen firebase, we need to build the best backend we can. With this setup you will be able to navigate to ANY endpoint or cloud function using file jump because the name will match. No file will be so large that you have to scroll through a list of other functions to find what you're looking for. Deployment will be easier because you won't have to worry about the paths not being correct or names clashing.

This is setup to make it so that when we want a new backend functionality all we do is, create a file, name it appropriately, write the code and then deploy that code. We'll have to think about the deployment process. I don't think it'll be as easy as that but we'll figure that out when we get there. We chose a backward compatible approach to the deployment for now so we'll just have to keep that in mind as we push out new code.

## Join the discussion and development!

If you like this setup or document, this entire project is being developed on the [FilledStacks YouTube channel](https://www.youtube.com/filledstacks). In addition to that there will be a discussion probably weekly on the decisions we need to make for the project aaaaaaand, we have a [Slack group](https://join.slack.com/t/filledstacks/shared_invite/zt-kjy2db0n-XJSiovQ69kVc1xcvekjA3w) with a dedicated boxtout channel where you can come and chat about the project. Please join in, I would really like the discussions and any contributions that you'd like to make.
