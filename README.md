# CFLux

### Recommendation to build/install the rails dependencies at onces (from the root) : 

```
bash cflux/bundle-installation
```

### So after that you can start the database (in the rails project cflux/): 

```
rails db:create
rails db:create
rails db:migrate:status
```

### And, finally, run the app (in the rails project cflux/): 

```
rails serve
```