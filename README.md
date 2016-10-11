# unwind_example cookbook

Attempt to unwind and then redefine an existing resource to fix notification associated with it.

**To test:** `kitchen test`

**Expected result:** converge completes successfully

**Actual result:** converge fails because the file resource gets executed first:

       Recipe: unwind_example::default
         * chef_gem[chef-rewind] action install (up to date)
         Converging 3 resources
         * file[/tmp/unwind_example/bar] action nothing (skipped due to action :nothing)
         * chef_gem[chef-rewind] action install (up to date)
         * directory[/tmp/unwind_example] action create
           - Would create new directory /tmp/unwind_example
         * file[/tmp/unwind_example/bar] action create
           * Parent directory /tmp/unwind_example does not exist.
           ================================================================================
           Error executing action `create` on resource 'file[/tmp/unwind_example/bar]'
           ================================================================================

           Chef::Exceptions::EnclosingDirectoryDoesNotExist
           ------------------------------------------------
           Parent directory /tmp/unwind_example does not exist.
