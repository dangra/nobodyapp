## Create and and deploy

```
fly apps create nobodyapp
fly vol create data
fly deploy
```

## Fly logs

```
$ fly logs
2023-03-01T17:27:31Z runner[2d46f629] scl [info]Starting instance
2023-03-01T17:27:31Z runner[2d46f629] scl [info]Configuring virtual machine
2023-03-01T17:27:31Z runner[2d46f629] scl [info]Pulling container image
2023-03-01T17:27:32Z runner[2d46f629] scl [info]Unpacking image
2023-03-01T17:27:32Z runner[2d46f629] scl [info]Preparing kernel init
2023-03-01T17:27:32Z runner[2d46f629] scl [info]Setting up volume 'data'
2023-03-01T17:27:32Z runner[2d46f629] scl [info]Uninitialized volume 'data', initializing...
2023-03-01T17:27:32Z runner[2d46f629] scl [info]Encrypting volume
2023-03-01T17:27:42Z runner[2d46f629] scl [info]Opening encrypted volume
2023-03-01T17:27:44Z runner[2d46f629] scl [info]Formatting volume
2023-03-01T17:27:45Z runner[2d46f629] scl [info]Configuring firecracker
2023-03-01T17:27:45Z runner[2d46f629] scl [info]Starting virtual machine
2023-03-01T17:27:45Z app[2d46f629] scl [info]Starting init (commit: 08b4c2b)...
2023-03-01T17:27:45Z app[2d46f629] scl [info]Mounting /dev/vdc at /data w/ uid: 65534, gid: 65534 and chmod 0755
2023-03-01T17:27:45Z app[2d46f629] scl [info]Preparing to run: `/init.sh` as nobody
2023-03-01T17:27:45Z app[2d46f629] scl [info]2023/03/01 17:27:45 listening on [fdaa:0:5ea6:a7b:100:5:5ea5:2]:22 (DNS: [fdaa::3]:53)
2023-03-01T17:27:45Z app[2d46f629] scl [info]/init.sh running as 'nobody'
2023-03-01T17:27:45Z app[2d46f629] scl [info]/data/file created or updated successfully
2023-03-01T17:27:45Z app[2d46f629] scl [info]drwxr-xr-x    4 nobody   nobody        4096 Mar  1 17:27 /data
2023-03-01T17:27:45Z app[2d46f629] scl [info]drwx------    2 root     root         16384 Mar  1 17:27 /data/lost+found
2023-03-01T17:27:45Z app[2d46f629] scl [info]find: /data/lost+found: Permission denied
2023-03-01T17:27:45Z app[2d46f629] scl [info]drwxr-xr-x    3 nobody   nobody        4096 Mar  1 17:27 /data/a
2023-03-01T17:27:45Z app[2d46f629] scl [info]drwxr-xr-x    3 nobody   nobody        4096 Mar  1 17:27 /data/a/b
2023-03-01T17:27:45Z app[2d46f629] scl [info]drwxr-xr-x    2 nobody   nobody        4096 Mar  1 17:27 /data/a/b/c
2023-03-01T17:27:45Z app[2d46f629] scl [info]-rw-r--r--    1 nobody   nobody           0 Mar  1 17:27 /data/a/b/c/d
2023-03-01T17:27:45Z app[2d46f629] scl [info]-rw-r--r--    1 nobody   nobody           0 Mar  1 17:27 /data/file
```

## SSH console

```
$ fly ssh console
/ # ps axf |grep nobody
  522 nobody    0:00 {init.sh} /bin/sh /init.sh
  529 nobody    0:00 sleep inf
  537 root      0:00 grep nobody

/ # find /data -exec ls -ld {} \;
drwxr-xr-x    4 nobody   nobody        4096 Feb 28 16:28 /data
-rw-r--r--    1 nobody   nobody           0 Feb 28 16:28 /data/file
drwxr-xr-x    3 nobody   nobody        4096 Feb 28 16:28 /data/a
drwxr-xr-x    3 nobody   nobody        4096 Feb 28 16:28 /data/a/b
drwxr-xr-x    2 nobody   nobody        4096 Feb 28 16:28 /data/a/b/c
-rw-r--r--    1 nobody   nobody           0 Feb 28 16:28 /data/a/b/c/d
drwx------    2 root     root         16384 Feb 28 16:14 /data/lost+found
```

After restarting the app with `fly apps restart nobodyapp`, file's permissions looks good too

```
2023-03-01T17:29:28Z runner[2d46f629] scl [info]Shutting down virtual machine
2023-03-01T17:29:28Z app[2d46f629] scl [info]Sending signal SIGINT to main child process w/ PID 529
2023-03-01T17:29:39Z runner[f8a8c7a9] scl [info]Starting instance
2023-03-01T17:29:39Z runner[f8a8c7a9] scl [info]Configuring virtual machine
2023-03-01T17:29:39Z runner[f8a8c7a9] scl [info]Pulling container image
2023-03-01T17:29:40Z runner[f8a8c7a9] scl [info]Unpacking image
2023-03-01T17:29:40Z runner[f8a8c7a9] scl [info]Preparing kernel init
2023-03-01T17:29:40Z runner[f8a8c7a9] scl [info]Setting up volume 'data'
2023-03-01T17:29:40Z runner[f8a8c7a9] scl [info]Opening encrypted volume
2023-03-01T17:29:40Z runner[f8a8c7a9] scl [info]Configuring firecracker
2023-03-01T17:29:40Z runner[f8a8c7a9] scl [info]Starting virtual machine
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]Starting init (commit: 08b4c2b)...
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]Mounting /dev/vdc at /data w/ uid: 65534, gid: 65534 and chmod 0755
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]Preparing to run: `/init.sh` as nobody
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]2023/03/01 17:29:40 listening on [fdaa:0:5ea6:a7b:100:5:5ea5:2]:22 (DNS: [fdaa::3]:53)
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]/init.sh running as 'nobody'
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]/data/file created or updated successfully
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]drwxr-xr-x    4 nobody   nobody        4096 Mar  1 17:27 /data
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]drwx------    2 root     root         16384 Mar  1 17:27 /data/lost+found
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]find: /data/lost+found: Permission denied
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]drwxr-xr-x    3 nobody   nobody        4096 Mar  1 17:27 /data/a
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]drwxr-xr-x    3 nobody   nobody        4096 Mar  1 17:27 /data/a/b
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]drwxr-xr-x    2 nobody   nobody        4096 Mar  1 17:27 /data/a/b/c
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]-rw-r--r--    1 nobody   nobody           0 Mar  1 17:29 /data/a/b/c/d
2023-03-01T17:29:40Z app[f8a8c7a9] scl [info]-rw-r--r--    1 nobody   nobody           0 Mar  1 17:29 /data/file
```
