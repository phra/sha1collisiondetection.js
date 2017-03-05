{
  "targets": [
    {
     "target_name": "sha1collisiondetection",
     "type": "<(library)",
     "actions": [
       {
           "action_name": "build_sha1collisiondetection",
           "inputs": [],
           "outputs": [ "sha1collisiondetection/obj_lib/sha1.o" ],
           "action": [ "make", "-C", "sha1collisiondetection" ]
       }
     ]
     },
    {
      "target_name": "sha1collisiondetectionjs",
      "sources": [ "lib/myobject.cc", "addon.cc" ],
      "include_dirs": [
        "<!(node -e \"require('nan')\")",
        "sha1collisiondetection/lib"
      ],
      "libraries": [ "/home/zio/code/sha1collisiondetection.js/sha1collisiondetection/bin/.libs/libdetectcoll.a" ],
      "dependencies": [
        'sha1collisiondetection'
      ]
    }
  ]
}
