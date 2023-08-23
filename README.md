# Images for external dependencies

The Makefile on this directory allows for the manipulation of container
images pertaining to external test dependencies, such as Mongo or iperf.

It contains three operations: the first exists to avoid the Dockerhub pull
limit, and also to allow for testing on disconnected clusters.  It simply
copies the images from their original locations into our Quay repo.

The second operation was created in response to an image used by our tests
that stopped getting updates, while the actual project continued to evolve.
It builds images from Dockerfile and pushes them into our Quay repo.

Finally, the third one also allows for the running of tests on disconnected
clusters, which cannot access the original locations of these dependencies
to download them (as they have no external Internet access.  The operation
allows for copying the list of images from our quay repo into another repo.

This allows for the test dependencies to be copied to the disconnected cluster's
local repository, from where the cluster can access them.  Additional
configuration will be required on the cluster (such as creating an MCO
to re-route the image pull requests), but that's out of the scope of
this document.


# skupper-test image

Note that the `skupper-test` image used by Skupper integration
is part of Skupper's own test code, so it's build by the main
code at https://github.com/skupperproject/skupper, and not here.
