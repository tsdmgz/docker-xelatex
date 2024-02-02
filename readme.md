# Building

Because I haven't gotten a script for this yet

Where `tex_platform` is either `aarch64-linux` or `x86_64-linux`. `arch` is what
architecture is specified for the image.

Defaults to `/document` as cwd. Use `-v ./:/document` to make its output easily
accessible.

`podman build --build-arg tex_platform=<tex_platform> --build-arg
tex_repository=<tex_mirror> --platform=<arch> -t xelatex-full ./`
