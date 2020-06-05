import os

CURRENT_DIR = os.path.dirname(os.path.realpath(__file__))
JUPYTER_BASE_DIR = os.environ.get('JUPYTER_CONFIG_DIR', CURRENT_DIR)

c.NotebookApp.allow_remote_access = True
c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.TerminalInteractiveShell.confirm_exit = False
c.NotebookApp.password = os.environ.get('JUPYTER_PASSWORD', '')
c.NotebookApp.notebook_dir = os.path.join(JUPYTER_BASE_DIR, 'notebooks')

if os.environ.get('DEBUG', False) == 'True':
    c.NotebookApp.notebook_dir = JUPYTER_BASE_DIR
    c.NotebookApp.password = ''
