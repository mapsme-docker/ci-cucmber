# How to

```
# Build image
docker build -t ci-cucumber .

# Run tests
mkdir out
docker run -v $(pwd)/out -t ci-cucumber
```
