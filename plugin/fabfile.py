import os
from fabric.api import env, hosts, run

env.hosts = ['rea.hola.com', 'diana.hola.com', 'satis.hola.com']
env.user = 'deployer'
env.password = os.environ['HOLA_DEPLOYER_PASSWORD']

@hosts('satis.hola.com')
def update_satis():
    run('./satis_packages.sh')
