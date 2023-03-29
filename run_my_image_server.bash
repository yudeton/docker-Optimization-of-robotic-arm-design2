# XAUTH=/tmp/.docker.xauth
# if [ ! -f $XAUTH ]
# then
#     xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
#     if [ ! -z "$xauth_list" ]
#     then
#         echo $xauth_list | xauth -f $XAUTH nmerge -
#     else
#         touch $XAUTH
#     fi
#     chmod a+r $XAUTH
# fi
xhost +local:docker 

nvidia-docker run -it \
    --user=iclab \
    --net=host \
    --rm --ipc=host \
    --runtime=nvidia \
    --privileged \
    -e LANG=C.UTF-8 \
    --volume=/dev:/dev \
    -p 8080:8080 \
    samkaiyang/opt_dynamic_design:v6 \
    /bin/bash
