# glew-extensions-updater

Shell scripts to update my [glew-with-extensions](https://github.com/tamaskenez/glew-with-extensions.git) repository:

- fetch the [nigels-com/glew](https://github.com/nigels-com/glew) repo
- execute `make extensions` on `master` and all `tags`
- merge the generated files into branches [master-ext](https://github.com/tamaskenez/glew-with-extensions/tree/master-ext) and `<tagname>-ext`
  branches (e.g. [glew-1.12.0-ext](https://github.com/tamaskenez/glew-with-extensions/tree/glew-1.12.0-ext))
- push to [glew-with-extensions](https://github.com/tamaskenez/glew-with-extensions.git)

