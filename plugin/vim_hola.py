import os
import subprocess


def run_tmux(command):
    """ Execute command in tmux pane"""
    FNULL = open(os.devnull, 'w')
    result = subprocess.call(
        ['tmux', 'send-keys', '-t', 'php:7', command, 'Enter'], stdout=FNULL)
    return result == 0


def fabric_command_for(task_name):
    fabfile_path = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                'fabfile')
    return "fab %s -f %s" % (task_name, fabfile_path)


def update_satis():
    task_name = 'update_satis'
    if run_tmux(fabric_command_for('update_satis')):
        print("Updating Satis.")


def update_satis_cmd():
    """ Return as string the fabric command: update_satis """
    return fabric_command_for('update_satis')


if __name__ == '__main__':
    update_satis()
