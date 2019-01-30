ruby_build
=========

Ansible role to build ruby from scratch.
As follows is the behavior of ruby_build role.

1. On remote machine, install packages needed to build ruby.
   Root user is required.
2. On control machine, download ruby source code.
3. On remote machine, unarchive ruby source code.
4. On remote machine, run `configure`.
5. On remote machine, run `make`.
6. On remote machine, run `make test`.
7. On remote machine, run `make install`. Root user is required.

Requirements
------------

None.

Role Variables
--------------

| Variable | Default | Description |
|----------|---------|-------------|
|`ruby_build_version`|`2.6.1`|to change ruby's version, change version and checksum at the same time|
|`ruby_build_download_url`|`https://cache.ruby-lang.org/pub/ruby/2.6`|base URL of ruby's tarball|
|`ruby_build_download_checksum`|hexadecimal hash value of ruby source tarball|to change ruby's version, change version and checksum at the same time|
|`ruby_build_download_local_dir`|`{{ playbook_dir }}/files`|download directory on control machine|
|`ruby_build_unarchive_remote_dir`|`{{ ansible_env.HOME }}/src`|unarchive directory on remote machine|
|`ruby_build_clear_previous_build`|`no`|remove work directory on remote machine before build|
|`ruby_build_configure_options`|None|`configure` options|
|`ruby_build_make_options`|`-j{{ ansible_processor_vcpus }}`|`make` options|
|`ruby_build_make_clean`|`no`|run `make clean` after build|
|`ruby_build_interpreter_path`|`/usr/local/bin/ruby`|install target path of ruby interpreter|
|`ruby_build_overwrite_install`|`false`|overwrite install even if build target version ruby is already installed|
|`ruby_build_required_packages_debian`|`gcc`, `make`|minimum packages required to build on debian platform|
|`ruby_build_optional_packages_debian`|`zlib1g-dev`, `libgdbm-dev`, `libssl-dev`, `libreadline-dev`|packages required to build extension libraries on debian platform|
|`ruby_build_required_packages_redhat`|`gcc`, `make`|minimum packages required to build on EL (RHEL, CentOS) platform|
|`ruby_build_optional_packages_redhat`|`zlib-devel`, `gdbm-devel`, `openssl-devel`, `readline-devel`|packages required to build extension libraries on EL (RHEL, CentOS) platform|
|`ruby_build_required_packages_other_os_family`|`[]`|minimum packages required to build, redefine for your other (not debian/EL) platform|
|`ruby_build_optional_packages_other_os_family`|`[]`|packages required to build extension librarieson, redefine for your other (not debian/EL) platform|

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
  - role: y10k.ruby_build
```

License
-------

BSD
