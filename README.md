# LogCatcher

A simple service that will receive logs from a client and save them to a persistent datastore for reading and searching later.


## Local Development Setup

```
$ cd $LOGCATCHER_HOME/ #go into director where logcatcher repo lives. 
$ bundle install
$ shotgun

```

## API

### Interface
GET


### Key Implementation Questions

curl -X POST http://localhost:9393/logs/ -H "Content-Type: application/json" -d '{"logs":[{"log":"This is some type of sample test message 0"}, {"log":"This is some type of sample test message 1"}, {"log":"This is some type of sample test message 2"}, {"log":"This is some type of sample test message 3"}]}'