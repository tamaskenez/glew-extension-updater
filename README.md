# glew-extensions-updater

Shell scripts to update my `glew-with-extensions` repository:

- fetches the `nigel/glew` repo
- execute `make extensions` on master and all tags
- merge the generated files into branches `master-ext` and `<tagname>-ext`
  branches (e.g. `glew-1.10.0-ext`)
- push to `glew-with-extensions`

