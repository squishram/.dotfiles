# from ranger.api.commands import Command
#
#
# class bulkrename(Command):
#     """
#     :bulkrename
#
#     This command opens a list of selected files in an external editor.
#     After you edit and save the file, it will generate a shell script
#     which does bulk renaming according to the changes you did in the file.
#
#     This shell script is opened in an editor for you to review.
#     After you close it, it will be executed.
#     """
#
#     def execute(self):
#         import tempfile
#         from ranger.ext.shell_escape import shell_escape as esc
#
#         # Create and edit the file list
#         filenames = [f.basename for f in self.fm.env.get_selection()]
#         listfile = tempfile.NamedTemporaryFile()
#         listfile.write("\n".join(filenames))
#         listfile.flush()
#         self.fm.run(['nvim', listfile.name])
#         listfile.seek(0)
#         new_filenames = listfile.read().split("\n")
#         listfile.close()
#         if all(a == b for a, b in zip(filenames, new_filenames)):
#             self.fm.notify("No renaming to be done!")
#             return
#
#         # Generate and execute script
#         cmdfile = tempfile.NamedTemporaryFile()
#         cmdfile.write("# This file will be executed when you close the editor.\n")
#         cmdfile.write("# Please double-check everything, clear the file to abort.\n")
#         cmdfile.write("\n".join("mv -vi " + esc(old) + " " + esc(new) \
#             for old, new in zip(filenames, new_filenames) if old != new))
#         cmdfile.flush()
#         self.fm.run(['nvim', cmdfile.name])
#         self.fm.run(['/bin/sh', cmdfile.name], flags='w')
#         cmdfile.close()
