pkg_origin=jmiller
pkg_name=hab-nodeapp
pkg_version=0.1.0
pkg_maintainer=jm@chef.io
pkg_license=()
pkg_source=https://s3-us-west-2.amazonaws.com/jmiller-chef-data/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=f805cd756f67ab3986c13161746fefa3574b0b0321b4c4e1c4cf089b393bbaa6
pkg_filename=${pkg_name}-${pkg_version}.tar.gz
pkg_deps=(core/node)
pkg_build_deps=()
#pkg_bin_dirs=(bin)
#pkg_include_dirs=(include)
#pkg_lib_dirs=(lib)
pkg_expose=(8080)

do_build() {
  # The mytutorialapp source code is unpacked into a directory,
  # mytutorialapp-0.1.0, at the root of $HAB_CACHE_SRC_PATH. If you were downloading
  # an archive that didn't match your package name and version, you would have to
  # copy the files into $HAB_CACHE_SRC_PATH.

  # This installs both npm as well as the nconf module we listed as a
  # dependency in package.json.
  echo "I AM HERE" $PWD
  npm install
}

do_install() {
  # Our source files were copied over to the HAB_CACHE_SRC_PATH in do_build(),
  # so now they need to be copied into the root directory of our package through
  # the pkg_prefix variable. This is so that we have the source files available
  # in the package.
  cp package.json ${pkg_prefix}
  cp server.js ${pkg_prefix}

  # Copy over the nconf module to the package that we installed in do_build().
  mkdir -p ${pkg_prefix}/node_modules/
  cp -vr node_modules/* ${pkg_prefix}/node_modules/
}

# Turn the remaining default phases into no-ops
#do_download() {
#  return 0
#}

#do_verify() {
#  return 0
#}

#do_unpack() {
#  return 0
#}
