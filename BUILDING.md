# Building Presto

Presto is a [NodeJS] application which uses many of the libraries
associated with that project.

I've been building [Thrift] from source so Thrift is not a dependency
for the project. You must copy the built and compiled thrift sources
into `node_modules/thrift` (the `package.json` in the Thrift sources
points to the correct sub-directory).


```bash
git clone https://github.com/Misterblue/Pesto.git pesto-git
cd pesto-git
npm install     # install the dependencies specified in package.json

npm start       # run the server
```

[NodeJS]: https://nodejs.org/
[Thrift]: https://thrift.apache.org/
[Basil viewer]: http://misterblue.github.io/basil/
[Ragu]: http://misterblue.github.io/ragu/


