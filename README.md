# Vue Reddit Parser

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Run your tests
```
npm run test
```

### Lints and fixes files
```
npm run lint
```
## Using Docker

### Build the image
```
docker build -t reddit-parser .
```

### Run the container
```
docker run -it -v ${PWD}/src:/usr/src/app/src -p 8080:8080 reddit-parser
```

