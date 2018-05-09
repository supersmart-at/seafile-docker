## For Project Maintainer: How to update seafile-docker when a new version is released

Imagine the previous version is 6.0.5 and we have released 6.0.7. Here are the steps to do the upgrade.

* Switch to a branch "master"
```sh
git branch -f master origin/master
git checkout master
```
* Update the version number in all the files/scripts from "6.0.5" to "6.0.7" and push it to github, then wait for travis ci (https://travis-ci.org/haiwen/seafile-docker/builds) to pass
```sh
git push origin master
```

* Normal

    * Create a tag "seafile-base" and push it to github. Wait for travis ci to finish: this time it would push the image seafileltd/base:16.04  to docker hub since it's triggered by a tag.
    ```sh
    git tag seafile-base
    git push origin seafile-base
    ```

    * Create a tag "v6.0.7" and push it to github. Wait for travis ci to finish: this time it would push the image seafileltd/seafile:6.0.7 to docker hub since it's triggered by a tag.
    ```sh
    git tag v6.0.7
    git push origin v6.0.7
    ```
    * Ensure the new image is available in https://hub.docker.com/r/seafileltd/seafile/tags/

* Pro

    * Create a tag "seafile-pro-base" and push it to github. Wait for travis ci to finish: this time it would push the image ${registry}/seafileltd/pro-base:16.04  to docker Registry since it's triggered by a tag.
    ```sh
    git tag seafile-pro-base
    git push origin seafile-pro-base
    ```
    
    * Create a tag "v6.0.7-pro" and push it to github. Wait for travis ci to finish: this time it would push the image ${registry}/seafileltd/seafile-pro:6.0.7 to docker Registry since it's triggered by a tag.
    ```sh
    git tag v6.0.7-pro
    git push origin v6.0.7
    ```
