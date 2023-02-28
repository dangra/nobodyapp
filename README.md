## Create and and deploy

```
fly apps create --machines nobodyapp
fly vol create data
fly deploy
```

## Fly logs

```
$ fly logs
2023-02-28T16:14:27Z runner[6e82751f703287] scl [info]Pulling container image
2023-02-28T16:14:29Z runner[6e82751f703287] scl [info]Unpacking image
2023-02-28T16:14:37Z runner[6e82751f703287] scl [info]Setting up volume 'data'
2023-02-28T16:14:37Z runner[6e82751f703287] scl [info]Uninitialized volume 'data', initializing...
2023-02-28T16:14:37Z runner[6e82751f703287] scl [info]Encrypting volume
2023-02-28T16:14:42Z runner[6e82751f703287] scl [info]Opening encrypted volume
2023-02-28T16:14:44Z runner[6e82751f703287] scl [info]Formatting volume
2023-02-28T16:14:44Z runner[6e82751f703287] scl [info]Configuring firecracker
2023-02-28T16:14:44Z app[6e82751f703287] scl [info]Starting init (commit: 08b4c2b)...
2023-02-28T16:14:44Z app[6e82751f703287] scl [info]Mounting /dev/vdb at /data w/ uid: 65534, gid: 65534 and chmod 0755
2023-02-28T16:14:44Z app[6e82751f703287] scl [info]Preparing to run: `/init.sh` as nobody
2023-02-28T16:14:44Z app[6e82751f703287] scl [info]2023/02/28 16:14:44 listening on [fdaa:0:5ea6:a7b:d33c:3d99:15c1:2]:22 (DNS: [fdaa::3]:53)
2023-02-28T16:14:44Z app[6e82751f703287] scl [info]nobody
2023-02-28T16:14:44Z app[6e82751f703287] scl [info]/data/file created or updated successfully
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
