# Vue Docker Skeleton

This is a new project starter to begin a new Vue.js app that easily builds a Docker development environment with a few simple commands.

These instructions assume you know how to get Docker running on your operating system of choice and find your way to a command line.  If you don't, try installing [Rancher Desktop](https://rancherdesktop.io/), and maybe watch the 5:43 firehose-of-information video on the home page.

If that doesn't get you started, find an online community of Vue.js developers, or Javascript developers, or just developers of any sort, and someone will probably know how to get you a step or two further.  If you need help finding an online community, [see if I'm available](https://tidycal.com/greenhollow/15min) to help you get plugged in somewhere.

## Creating Your Project

**First**, clone this repository:
```
git clone git@github.com:iisisrael/vue-docker-skeleton.git
```

**Second**, change the directory name to your project name:
```
mv vue-docker-skeleton my-project-name
```

**Third**, remove the `.git` directory and license file:
```
cd my-project-name
rm -rf .git
rm LICENSE
```

**Fourth** (probably), initialize your own version control, however you prefer, which I imagine would be something like:
```
git init
```

**Fifth**, change all the instances of "`my_project`" in the `makefile` to the name of your project.

**Sixth**, build *only* the CLI docker image:
```
make cli-build
```

**Seventh**, run the CLI, and at the bash prompt, initialize the Vue.js app:
```
make cli
root@abcfdg:/vue-cli$ vue create app
```

**Eighth**, delete the text from the first line above and down through this "**Creating**" section (you no longer need it and it would just be impishly confusing folks if left hanging around), and procede with the steps below.  If you're managing this project in version control (which, I assume, you are), now might be a good time to push your changes.  Also consider updating the "**Testing**" and "**Deploying**" sections below as you engineer those into your project.

## Build

After cloning this repository locally, open a terminal in the project root directory, and run the build commands:
```
make cli-build
make dev-build
```

## Development

### The Command Line Container

The CLI container lets you operate on the project without needing to install Node or muck around with node version management.  The CLI container can run the CLI image (built above) like so:
```
make cli
```

From within the `app/` directory in the CLI container, all the normal NPM and Vue operations can be performed:
```
cd app
npm outdated
vue help
```

### First Time Prep for the Development Container

Before running the dev container for the first time, NPM packages **must** be installed using the CLI container:
```
npm install
```

After installing packages, exit the CLI container or start another shell (as in, a new tab in your command line terminal app, probably) to continue with running the dev container.

### The Vue.js Development Container

The dev container can run the dev image (built above) to serve the local development web site:
```
make dev
```

### Testing

Run linting from the CLI (make sure you're in the app directory):
```
cd app
npm run lint
```

More instructions on running automated tests should go here, depending on whichever test suite you choose.  You did choose one, right?  Something like [Mocha](https://mochajs.org/) or [Jest](https://jestjs.io/), right?  Right on.

## Staging

The staging image can be built and run to give the impression that a production deploy will execute smoothly.
```
make stage-build
make stage
```

## Deploying

There's only 1x10^42 ways to automate deployment of a project to production, so this is on you.  Good luck!
